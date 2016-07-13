class ProductsFkProductcolors < ActiveRecord::Migration
  def change
    add_foreign_key "product_colors", "products"
    add_foreign_key "sizes", "product_colors"
  end
end
