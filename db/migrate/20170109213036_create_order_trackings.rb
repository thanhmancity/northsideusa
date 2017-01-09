class CreateOrderTrackings < ActiveRecord::Migration
  def change
    create_table :order_trackings do |t|
      t.integer :order_id
      t.integer :carrier
      t.string :tracking_number
      t.datetime :date_shipped

      t.timestamps null: false
    end
  end
end
