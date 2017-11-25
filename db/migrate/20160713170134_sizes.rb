class Sizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.integer :product_id
      t.decimal :unit_price, precision: 9, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 9, scale: 2

      t.timestamps null: false
    end
  end
end
