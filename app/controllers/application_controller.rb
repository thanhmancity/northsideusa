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

  def big_decimal_numb numb
    BigDecimal.new(numb.to_s)
  end


  def sorter
    products = Product.where(id: session[:product_ids]).joins(:product_colors, :product_categories).where(age_group: 'a', enabled: 1)
    if params[:sort_type].to_sym == :price
      products = filter_by_type(products.uniq).order(price: params[:type_order].to_sym)

    elsif params[:sort_type].to_sym == :popular
      products = products.select('products.*, product_colors.color, product_colors.id AS pcid')
      products = products.sort_by do |product|
        if params[:type_order] == 'ASC'
          -product.order_items.sum(:quantity)
        else
          product.order_items.sum(:quantity)
        end
      end
    end
    params[:type_order] = params[:type_order] == 'ASC' ? 'DESC' : 'ASC'
    products
  end

  def filter_by_type products
    case session[:filter_type].try(:to_sym)
    when :gender
      products = products.where(gender: session[:filter])
    when :category
      products = products.where('product_categories.category_id = ?', session[:filter])
    when :color
      products = products.where('product_colors.color_family_id IN (?)', session[:filter])
    end
    products
  end

  def filter
    params[:type_order] ||= 'ASC'
    session[:filter_type] = params[:filter_type].try(:to_sym) if params[:filter_type].present?
    case params[:filter_type].try(:to_sym)
    when :gender
      session[:filter] = params[:sex]
      products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: params[:sex], age_group: 'a', enabled: 1)
    when :category
      session[:filter] = params[:category_id]
      products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'a', enabled: 1).where('product_categories.category_id = ?', params[:category_id])
    when :color
      session[:filter] = params[:color_family_id]
      products = Product.joins(:product_colors, :product_categories).where(age_group: 'a', enabled: 1).where('product_colors.color_family_id = ?', params[:color_family_id])
    when :size
      params_size = params[:size].to_f.round(1)
      params[:size] = (params_size == params_size.to_i) ? params_size.to_i :  params_size
      session[:filter] = params[:size]
      product_color_ids = Size.where('size like ?', params[:size]).pluck(:product_color_id)
      products = Product.joins(:product_colors, :product_categories).where(age_group: 'a', enabled: 1).where('product_colors.id IN (?)', product_color_ids)
    when :price
      min_price = big_decimal_numb(params[:min_price].to_f)
      max_price = big_decimal_numb(params[:max_price].to_f)
      params[:price] = {min_price:min_price,max_price: max_price}
      products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'a', enabled: 1).where(price: min_price..max_price).uniq
    end

    products = sorter if params[:sort_type].present?
    if session[:filter_type].try(:to_sym).eql?(:color)
      @m_products = products.select('products.*, product_colors.color, product_colors.id AS pcid').where('product_colors.color_family_id = ?', session[:filter])
    else
      if params[:sort_type].eql?('popular')
        @m_products = products
      else
        @m_products = products.select('products.*, product_colors.color, product_colors.id AS pcid')
      end
    end
    session[:product_ids] = @m_products.pluck(:id) if params[:filter_type].present?
  end
end
