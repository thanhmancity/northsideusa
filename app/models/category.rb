class Category < ActiveRecord::Base
  extend FriendlyId
  alias_attribute :slug, :category
  has_many        :product_categories
  has_many        :products, through: :product_categories
  enum display: {hidden: 0, displayed: 1}
  before_save :update_tag
  def update_tag
    self.tag = self.category.try(:parameterize).try(:downcase)
  end
end
