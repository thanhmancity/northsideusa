class AddDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :discount, :decimal, precision: 9, scale: 2, :after => :shipping
  end
end
