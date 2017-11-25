class SubCategory < ApplicationRecord
  extend FriendlyId
  alias_attribute :slug, :name
  has_many :products
  friendly_id :name, use: :slugged
  has_many :children, class_name: self.name, foreign_key: :parent_id
  belongs_to :parent, class_name: self.name, foreign_key: :parent_id
  mount_uploader :image, ImageUploader

  scope :roots, -> {where parent_id: nil}
end
