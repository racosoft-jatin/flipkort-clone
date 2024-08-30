class Catalogue < ApplicationRecord 
	has_many :catalogue_variants, dependent: :destroy
	belongs_to :category
	belongs_to :subcategory, class_name: 'SubCategory'
	belongs_to :brand

    enum gender: { male: 0, female: 1, unisex: 2 }

	accepts_nested_attributes_for :catalogue_variants, allow_destroy: true


	#include PgSearch::Model

     # pg_search_scope :search_by_name,
     #              against: [:name],
     #              using: { tsearch: { prefix: true } }

      searchkick

      


end

