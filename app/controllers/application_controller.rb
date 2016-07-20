class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def self.paytrace_connection
    OAuth2::Client.new(nil, nil,
      site: ENV['HERMES_AUTHENTICATION_SERVER'],
      ssl: {verify: ENV['HERMES_DISABLE_SSL_VERIFICATION'] != '1', version: 'TLSv1'}
    ).password.get_token(
      ENV['HERMES_USERNAME'],
      ENV['HERMES_PASSWORD']
    )
  end

  protected
  def paytrace_connection
    self.class.paytrace_connection
  end
end
