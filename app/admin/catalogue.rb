ActiveAdmin.register Catalogue do
  permit_params :name, :description, :gender, :category_id, :subcategory_id, :brand_id,
                catalogue_variants_attributes: [
                  :id, :price, :catalogue_variant_color_id, :catalogue_variant_size_id, :quantity, :_destroy,
                  attachments_attributes: [
                    :id, :media, :status, :catalogue_variant_id, :_destroy
                  ]
                ]

  filter :name
  filter :gender, as: :select, collection: Catalogue.genders.map { |key, value| [key.to_s.titleize, value] }

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :gender
    column :category_id
    column :subcategory_id
    column :brand_id
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :name
      f.input :description
      f.input :gender, as: :select, collection: Catalogue.genders.keys.map { |gender| [gender.capitalize, gender] }
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.id] }
      f.input :subcategory_id, as: :select, collection: SubCategory.all.map { |s| [s.id] }
      f.input :brand_id, as: :select, collection: Brand.all.map { |b| [b.id] }
    end

    f.inputs do
      f.has_many :catalogue_variants, new_record: true, heading: 'Catalogue Variants', one_new_record: 'Add Variant', remove_record: 'Remove Variant', allow_destroy: true do |ff|
        ff.input :price
        ff.input :catalogue_variant_color_id, as: :select, collection: CatalogueVariantColor.all.map { |c| [c.name, c.id] }
        ff.input :catalogue_variant_size_id, as: :select, collection: CatalogueVariantSize.all.map { |s| [s.name, s.id] }
        ff.input :quantity

        ff.has_many :attachments, allow_destroy: true, new_record: true, remove_record: 'Remove Attachment' do |attachment|
          attachment.input :media, as: :file, input_html: { multiple: false }, hint: attachment.object.media.attached? ? image_tag(attachment.object.media, height: 100, width: 100) : content_tag(:span, 'No image')
        end
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :gender do |catalogue|
        catalogue.gender.capitalize
      end
      row :category_id
      row :subcategory_id
      row :brand_
      row :created_at
    end
  end
end
