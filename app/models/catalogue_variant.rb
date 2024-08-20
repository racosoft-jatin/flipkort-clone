class CatalogueVariant < ApplicationRecord
	belongs_to :catalogue
	belongs_to :catalogue_variant_color
	belongs_to :catalogue_variant_size

  has_many :attachments, class_name: 'CatalogueAttachment', foreign_key: 'catalogue_variant_id', dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
