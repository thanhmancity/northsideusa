class ProductColor < ActiveRecord::Base
  has_many   :products, through: :product_colors
  belongs_to :product
end
