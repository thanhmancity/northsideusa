class CreateOrderBillings < ActiveRecord::Migration
  def change
    create_table :order_billings do |t|
      t.integer :order_id
      t.string :bill_first_name
      t.string :bill_last_name
      t.string :bill_address1
      t.string :bill_address2
      t.string :bill_city
      t.string :bill_state
      t.string :bill_zip

      t.timestamps null: false
    end
  end
end
