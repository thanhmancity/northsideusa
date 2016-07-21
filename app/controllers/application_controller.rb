class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def self.paytrace_api
    OAuth2::Client.new(
      nil, nil,
      site: 'https://api.paytrace.com',
    ).password.get_token('demo123', 'demo123')
  end

  protected
  def paytrace_api
    self.class.paytrace_api
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
