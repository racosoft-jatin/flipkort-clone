ActiveAdmin.register Catalogue do
  permit_params :name, :description, :gender, :category_id, :subcategory_id, :brand_id, :activated,
                catalogue_variants_attributes: [
                  :id, :price, :catalogue_variant_color_id, :catalogue_variant_size_id, :quantity, :_destroy,
                  attachments_attributes: [
                    :id, :media, :status, :catalogue_variant_id, :_destroy
                  ]
                ]

  filter :name
  filter :category
  filter :gender, as: :select, collection: Catalogue.genders.map { |key, value| [key.to_s.titleize, value] }
  filter :name, as: :string, label: 'Search by Name'
  
  # Custom action for toggling activation status
  batch_action :toggle_activation, form: true do |ids|
    Catalogue.where(id: ids).find_each do |catalogue|
      catalogue.update(activated: !catalogue.activated)
    end
    redirect_to collection_path, alert: "Activation status updated successfully."
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :gender
    column :category
    column :subcategory
    column :brand
    column :created_at
    actions
  end

  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url

    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor, input_html: { ckeditor: { toolbar: 'mini', height: 50, width: 500} }
      f.input :gender, as: :select, collection: Catalogue.genders.keys.map { |gender| [gender.capitalize, gender] }
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }, input_html: { id: 'category_select' }
      f.input :subcategory, as: :select, collection: SubCategory.all.map { |s| [s.name, s.id] }, input_html: { id: 'subcategory_select' }
      f.input :brand, as: :select, collection: Brand.all.map { |b| [b.name, b.id] }
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
      row :category
      row :subcategory
      row :brand
      row :created_at
    end
  end
end
