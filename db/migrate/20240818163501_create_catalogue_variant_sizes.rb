class CreateCatalogueVariantSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :catalogue_variant_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
