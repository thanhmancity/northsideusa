class OrderMailer < ApplicationMailer
    default from: 'orders@triplettrading.com'
 
    def order_confirmation(order)
        @order = order
        @order_shipping = OrderShipping.find_by(order_id: @order.id)
        mail(to: @order_shipping.email_address, subject: 'Order Confirmation - W' + @order.id.to_s)
    end
end
