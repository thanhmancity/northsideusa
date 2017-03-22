class AddTrackingNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tracking_number, :string, :after => :order_status_id
  end
end
