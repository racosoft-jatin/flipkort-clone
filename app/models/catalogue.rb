class Catalogue < ApplicationRecord 
	has_many :catalogue_variants, dependent: :destroy

	accepts_nested_attributes_for :catalogue_variants, allow_destroy: true
	
end
