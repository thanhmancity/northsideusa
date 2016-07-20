class OrdersController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_shipping = OrderShipping.find_by(order_id: @order.id)
    @order_shipping.update_attributes(order_shipping_params)
    @order_billiing = OrderBilling.find_by(order_id: @order.id)
    @order_billiing.update_attributes(order_billing_params)
    # API Call to PayTrace
    # Save Order
    # Redirect to Order_thanks
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :product_color_id, :size_id)
  end
  private
  def order_shipping_params
    params.permit(:ship_first_name, :ship_last_name, :email_address, :phone, :ship_address1, :ship_address2, :ship_city, :ship_state, :ship_zip)
  end
  private
  def order_billing_params
    params.permit(:bill_first_name, :bill_last_name, :bill_address1, :bill_address2, :bill_city, :bill_state, :bill_zip)
  end
end
