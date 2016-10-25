class AddShippingDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_discount, :decimal, precision: 9, scale: 2, :after => :discount
  end
end
