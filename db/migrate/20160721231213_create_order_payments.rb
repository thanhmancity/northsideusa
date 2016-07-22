class CreateOrderPayments < ActiveRecord::Migration
  def change
    create_table :order_payments do |t|
      t.integer :order_id
      t.string :order_transaction_id
      t.string :order_approval_code

      t.timestamps null: false
    end
  end
end
