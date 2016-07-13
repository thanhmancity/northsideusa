class OrderitemFkProductcolor < ActiveRecord::Migration
  def change
    add_foreign_key "order_items", "product_colors"
  end
end
