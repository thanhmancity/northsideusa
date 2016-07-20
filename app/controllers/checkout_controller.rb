class CheckoutController < ApplicationController
  def show
    @order = current_order
    @order_shipping = OrderShipping.create(:order_id => @order.id)
    @order_billing = OrderBilling.create(:order_id => @order.id)
    @order.save
  end
  def shipping
  end

  def billing
  end

  def delivery
  end

  def payment
  end

  def review
  end
end
