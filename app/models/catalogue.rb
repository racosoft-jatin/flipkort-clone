class Catalogue < ApplicationRecord 
	has_many :catalogue_variants, dependent: :destroy

  enum gender: { male: 0, female: 1, unisex: 2 }

	accepts_nested_attributes_for :catalogue_variants, allow_destroy: true
end
