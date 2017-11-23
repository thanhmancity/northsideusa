class OrderitemFkProductcolor < ActiveRecord::Migration
  def change
    add_column :order_items, :product_colors, :integer
  end
end
