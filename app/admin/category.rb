ActiveAdmin.register Category do

  menu parent: 'Catalogues', label: 'Category / Subcategory'
  permit_params :name, :activated, sub_categories_attributes: [ :id, :name, :category_id, :_destroy ]

  filter :name, as: :string, label: 'Search by Name'

  index do
    selectable_column
    id_column
    column :name
    column :sub_categories_name
    column :created_at
    actions
  end

   includes :sub_categories

  form do |f|
    f.inputs do
      f.input :name
    end

    f.has_many :sub_categories,
               heading: true,
               new_record: 'Create Subcategory',
               remove_record: 'Remove Subcategory',
               allow_destroy: true do |ff|
      ff.input :name
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :sub_categories_name
      row :created_at
    end
  end
end
