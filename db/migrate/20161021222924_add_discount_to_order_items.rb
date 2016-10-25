class AddDiscountToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :discount, :decimal, precision: 9, scale: 2, :after => :total_price
  end
end
