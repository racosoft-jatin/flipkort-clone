class AddCategoryIdSubcategoryIdBrandIdToCatalogues < ActiveRecord::Migration[7.1]
  def change
    add_column :catalogues, :category_id, :integer
    add_column :catalogues, :subcategory_id, :integer
    add_column :catalogues, :brand_id, :integer
  end
end
