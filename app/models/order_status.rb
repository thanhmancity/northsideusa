class OrderStatus < ActiveRecord::Base
  # associations
  has_many :orders
end
