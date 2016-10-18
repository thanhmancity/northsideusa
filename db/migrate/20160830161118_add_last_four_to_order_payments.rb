class AddLastFourToOrderPayments < ActiveRecord::Migration
  def change
    add_column :order_payments, :last_four, :int, :after => :order_approval_code
  end
end
