class Product < ActiveRecord::Base
  # associations
  has_many :order_items
  has_many :product_colors

  default_scope { where(enabled: true) }
end
