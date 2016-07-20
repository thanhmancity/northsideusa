class OrdersController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    # Get current order
    @order = current_order
    # Update Shipping
    @order_shipping = OrderShipping.find_by(order_id: @order.id)
    if @order_shipping
      @order_shipping = OrderShipping.where(:order_id => @order.id).update_all(order_shipping_params)
    else
      @order_shipping = OrderShipping.create(:order_id => @order.id)
      @order_shipping = OrderShipping.where(:order_id => @order.id).update_all(order_shipping_params)
    end
    # Update Billing
    @order_billing = OrderBilling.find_by(order_id: @order.id)
    if @order_billing
      @order_billing = OrderBilling.where(:order_id => @order.id).update_all(order_billing_params)
    else
      @order_billing = OrderBilling.create(:order_id => @order.id)
      @order_billing = OrderBilling.where(:order_id => @order.id).update_all(order_billing_params)
    end
    # API Call to PayTrace
    # response = Transaction.sale(
    # {
    #   amount: "1.00",
    #   card_number: "4111111111111111",
    #   expiration_year: 17,
    #   expiration_month: 3
    # })

    #
    ## Response information is available on the transaction
    #
    # puts response.get_response() # 101. Your transaction was successfully approved.

    #
    ## All values returned are accessible through the response
    #
    # response.values do |key, value|
    #     puts key      # e.g. APPCODE
    #     puts value    # TAS671
    # end
    # Save
    # Save Order
    # Update Order Status
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
