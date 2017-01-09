class OrdersController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    @promo = current_promo
  end

  def update
    # Get current order
    @order = current_order
    
    # Get promos
    @promo = current_promo

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

    @order_billing = OrderBilling.find_by(order_id: @order.id)

    # API Call to PayTrace
    @transaction_error = nil
    # Build Request
    request = params[:sale]

    puts "State: " + @order_billing.bill_state.to_s

    if @order_billing.bill_state.to_s == "WA"
      adjusted_tax = @order.total * 0.07
      @order.tax = adjusted_tax
      adjusted_total = @order.subtotal + @order.shipping + adjusted_tax
      @order.total = adjusted_total
      # @order.save
      @order = Order.where(:id => @order.id).update_all(tax: adjusted_tax, total: adjusted_total)
    end

    @order = Order.find_by(id: current_order.id)
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

    if @success.to_s == "true" and @approval_code.to_s != ''

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
      
      # Update Promo redemtion status
      @promo = Promo.where(:id => @promo.id).update_all(redeemed: 1, redeemed_date: DateTime.now.to_date)

      # Grab the current order
      @order = current_order
      @order_items = @order.order_items

      # render Order_thanks
      # render :action => "thankyou"
      redirect_to action: "thankyou", id: @order.id
    else
      # throw error to page
      @transaction_error = parsed_response["status_message"]
      render :action => "update"
    end
    puts @transaction_error
    # @order = Order.find_by(id: current_order.id)
    # OrderMailer.order_confirmation(@order.id).deliver_now
  end
  def thankyou
    @order = Order.find_by(id: current_order.id)
    @order_items = @order.order_items
    @tax = Order.where(id: @order.id).pluck(:tax).at(0)
    @total = Order.where(id: @order.id).pluck(:total).at(0)
    @promo = current_promo
    OrderMailer.order_confirmation(@order.id, @promo.id).deliver_now
    session[:order_id] = nil
    session[:promo_id] = nil
  end
  def shipped
    # take a form field value for tracking number and store it with the order
    # Grab order data
    # call shipping confirmation mailer code
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
