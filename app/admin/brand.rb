NO_IMAGE = 'No Image'
ActiveAdmin.register Brand do
  permit_params :name, :image

  filter :name


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

  # Define the form for creating/editing Brand
  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :name
      f.input :image, as: :file
   
    end

    f.actions
  end

  # Define the show page for Brand
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
