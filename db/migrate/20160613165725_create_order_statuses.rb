class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :name, limit: 100

      t.timestamps null: false
    end
  end
end
