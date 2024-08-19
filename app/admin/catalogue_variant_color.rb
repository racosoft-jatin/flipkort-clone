ActiveAdmin.register CatalogueVariantColor do
  permit_params :name, :color_code

  index do
    selectable_column
    id_column
    column :name
    column :color_code
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :color_code
    end

    f.actions
  end


show do
    attributes_table do
      row :name
      row :color_code
      row :created_at
    end
  end
end
