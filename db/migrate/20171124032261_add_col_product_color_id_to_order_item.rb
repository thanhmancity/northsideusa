class AddColProductColorIdToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :product_color_id, :integer, null: false
    add_column :order_items, :size_id, :integer, null: 0
  end
end
