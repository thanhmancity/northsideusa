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
    @transaction_error = nil
    # Build Request
    request = params[:sale]

    # request[:amount] = 0.2
    request[:amount] = @order.total
    request[:invoice_id] = @order.id
    request[:billing_address] = {:street_address => params[:bill_address1], :zip => params[:ship_zip]}
    
    puts request

    @request = request.to_json # For display
    
    puts @request

    # Build Response
    begin
      response = paytrace_api.post('/v1/transactions/authorization/keyed', body: request)
    rescue Exception => e 
      @transaction_failure = e.message
      @transaction_failure[0] = ''
      @transaction_failure = ActiveSupport::JSON.decode(@transaction_failure)
      puts @transaction_failure
    end
    
    
    if response
      puts response.status
      @response_status = response.status
      @response = response.body
    
      puts "response: >>>" + @response + "<<<"
    else
      @response = ActiveSupport::JSON.encode(@transaction_failure)
      puts @response
    end

    # Update Payment
    parsed_response = JSON.parse(@response)
    @transaction_id = parsed_response["transaction_id"]
    puts @transaction_id
    @approval_code = parsed_response["approval_code"]
    puts @approval_code
    @success = parsed_response["success"]
    puts @success
    
    if @success == "true" && @approval_code != ""
    
      @order_payment = OrderPayment.find_by(order_id: @order.id)
      if @order_payment
        @order_payment = OrderPayment.where(:order_id => @order.id).update_all(order_transaction_id: @transaction_id, order_approval_code: @approval_code)
      else
        @order_payment = OrderPayment.create(:order_id => @order.id)
        @order_payment = OrderPayment.where(:order_id => @order.id).update_all(order_transaction_id: @transaction_id, order_approval_code: @approval_code)
      end
      
      # curr_id = @order.id
      
      
      # Update Order Status
      @order = Order.where(:id => @order.id).update_all(order_status_id: 2)
      
      # Grab the current order
      @order = current_order
      @order_items = @order.order_items
      
      # Kill Session?
      
      # render Order_thanks
      # render :action => "thankyou"
      redirect_to action: "thankyou", id: @order.id
    else
      # throw error to page
      @transaction_error = parsed_response["status_message"]
      render :action => "update"
    end
    puts @transaction_error
  end
  def thankyou
    @order = current_order
    @order_items = @order.order_items
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
  
  private
  def order_payment_params
    params.permit()
  end
end
