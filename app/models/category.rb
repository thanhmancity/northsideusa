class Category < ActiveRecord::Base
  has_many :products, through: :product_categories
end
