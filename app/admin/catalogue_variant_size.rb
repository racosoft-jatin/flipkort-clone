ActiveAdmin.register CatalogueVariantSize do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :name
    end

    
    f.actions
  end

show do
    attributes_table do
      row :name
      row :created_at
    end
  end
end
