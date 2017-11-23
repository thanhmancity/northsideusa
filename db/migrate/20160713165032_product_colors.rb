class ProductColors < ActiveRecord::Migration[5.0]
  def change
    create_table :product_colors do |t|
      t.integer :product_id
      t.integer :order_id
      t.decimal :unit_price, precision: 9, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 9, scale: 2

      t.timestamps null: false
    end
  end
end
