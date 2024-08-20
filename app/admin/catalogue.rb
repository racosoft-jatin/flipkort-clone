ActiveAdmin.register Catalogue do
  permit_params :name, :description, :gender, catalogue_variants_attributes: [:id, :price,
                :catalogue_variant_color_id, :catalogue_variant_size_id, :quantity,
                :_destroy]

  filter :name
  filter :gender_eq, as: :select, collection: Catalogue.genders.map { |key, value| [key.to_s.titleize, value] }
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :gender
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :gender, as: :select, collection: Catalogue.genders.keys.collect { |gender| [gender.capitalize, gender] }
    end

    f.has_many :catalogue_variants,
               heading: 'Catalogue Variants',
               new_record: 'Add Variant',
               remove_record: 'Remove Variant',
               allow_destroy: true do |ff|
      ff.input :price
      ff.input :catalogue_variant_color_id, as: :select, collection: CatalogueVariantColor.all.collect { |c| [c.name, c.id] }
      ff.input :catalogue_variant_size_id, as: :select, collection: CatalogueVariantSize.all.collect { |s| [s.name, s.id] }
      ff.input :quantity
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :gender
      row :created_at
    end
  end
end
