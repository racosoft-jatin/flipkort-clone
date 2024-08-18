class CreateCatalogues < ActiveRecord::Migration[7.1]
  def change
    create_table :catalogues do |t|
      t.string :name
      t.text :description
      t.integer :gender

      t.timestamps
    end
  end
end
