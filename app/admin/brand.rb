NO_IMAGE = 'No Image'
ActiveAdmin.register Brand do
  menu parent: 'Catalogues'

  permit_params :name, :image

  filter :name, as: :string, label: 'Search by Name'



  index do
    selectable_column
    id_column
    column :name
    column :image do |brand|
      brand.image.attached? ? image_tag(brand.image) : content_tag(:span, NO_IMAGE)
    end
     column :created_at
    actions
  end


   form do |f|
    f.inputs 'Brand Details' do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end

 
  show do
    attributes_table do
      row :name
      row :image do |brand|
              brand.image.attached? ? image_tag(brand.image) : content_tag(:span, NO_IMAGE)
            end
      row :created_at
    end
  end
end
