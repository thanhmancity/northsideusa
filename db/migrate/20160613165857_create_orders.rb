class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 9, scale: 2
      t.decimal :tax, precision: 9, scale: 2
      t.decimal :shipping, precision: 9, scale: 2
      t.decimal :total, precision: 9, scale: 2
      t.references :order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
