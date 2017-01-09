class OrderMailer < ApplicationMailer
    default from: 'orders@triplettrading.com',
        cc: 'orders@triplettrading.com',
        bcc: ['jeffj@triplettrading.com', 'WebOrdersGroup@triplettrading.com']

    def order_confirmation(order_id, promo_id)
      @order = Order.find_by(id: order_id)
      @order_shipping = OrderShipping.find_by(order_id: @order.id)
      @order_billing = OrderBilling.find_by(order_id: @order.id)
      @order_items = @order.order_items
      @order_payment = OrderPayment.find_by(order_id: @order.id)
      Order.uncached do
        @tax = Order.where(id: order_id).pluck(:tax).at(0)
        @total = Order.where(id: order_id).pluck(:total).at(0)
      end
      @promo = Promo.find_by(id: promo_id) || ''
      mail(to: @order_shipping.email_address, subject: 'Order Confirmation - ' + @order.id.to_s)
    end
    
    def shipping_confirmation(order_id)
      
    end
end
