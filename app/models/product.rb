class Product < ActiveRecord::Base
  # associations
  has_many   :order_items
  has_many   :product_colors
  has_many   :sizes
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :sub_category

  default_scope { where(enabled: true) }
end
