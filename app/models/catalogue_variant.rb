class CatalogueVariant < ApplicationRecord
	belongs_to :catalogue
	belongs_to :catalogue_variant_color
	belongs_to :catalogue_variant_size

end