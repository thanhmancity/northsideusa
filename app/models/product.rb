class Product < ActiveRecord::Base
  # associations
  has_many :order_items

  default_scope { where(enabled: true) }
end
