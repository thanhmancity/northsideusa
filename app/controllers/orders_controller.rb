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
    # params contains the data posted from the "checkout" form (see the
    # "checkout" action in this class)

    request = params[:sale]

    # This is where you would make any adjustments to the information gathered by
    # Rails into "request", such as setting request[:amount] based on an invoice
    # or the current cart balance.
    request[:amount] = cart_total

    @request = request.to_json # For display

    response = paytrace_api.post('/v1/transactions/sale/keyed', body: request)
    @response_status = response.status
    @response = response.body

    # In a real application, you would capture the result of paytrace_api.post
    # in a model instance, then redirect to a page displaying the information,
    # obtaining it for display from the model object.
    # Save
    # Save Order
    # Update Order Status
    # Redirect to Order_thanks
  end

  protected

  def cart_total
    10.00
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
