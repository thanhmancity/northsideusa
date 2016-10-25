class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def self.paytrace_api
    if ENV['RAILS_ENV'] == "development"
      OAuth2::Client.new(
        nil, nil,
        site: 'https://api.paytrace.com',
      ).password.get_token('demo123', 'demo123')
    else
      OAuth2::Client.new(
        nil, nil,
        site: 'https://api.paytrace.com',
      ).password.get_token('northside_ecommerce', 'B!gSho3H0rn')
    end
  end

  protected
  def paytrace_api
    self.class.paytrace_api
  end

  def current_order
    if !session[:order_id].nil?
      #tmp_order = Order.find(session[:order_id])
      #if tmp_order.order_status_id != 1
      #  Order.new
      #else
        Order.find(session[:order_id])
     # end
    else
      Order.new
    end
  end

  def current_promo
    if !session[:promo_id].nil?
      Promo.find(session[:promo_id])
    else
      Promo.new
    end
  end
end
