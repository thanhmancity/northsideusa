class CreateOrderShippings < ActiveRecord::Migration
  def change
    create_table :order_shippings do |t|
      t.integer :order_id
      t.string :ship_first_name
      t.string :ship_last_name
      t.string :email_address
      t.string :phone
      t.string :ship_address1
      t.string :ship_address2
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zip

      t.timestamps null: false
    end
  end
end
