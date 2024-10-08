class Category < ApplicationRecord
	has_many :sub_categories, dependent: :destroy

	 validates :name, uniqueness: true

	accepts_nested_attributes_for :sub_categories, allow_destroy: true

	def sub_categories_name
		sub_categories.map{ |s| s.name }
	end


  # include PgSearch

  #    pg_search_scope :search_by_name,
  #                 against: [:name],
  #                 using: { tsearch: { prefix: true } }

  searchkick
end
