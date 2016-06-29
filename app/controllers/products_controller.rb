class ProductsController < ApplicationController
  def index
    @products = Product.where(enabled: 1)
    @order_item = current_order.order_items.new
  end

  def show
    @products = Product.find(params[:id])
  end

  def men
    @products = Product.where(gender: 'm', age_group: 'a', enabled: 1)
    @order_item = current_order.order_items.new
  end

  def women
    @products = Product.where(gender: 'f', age_group: 'a', enabled: 1)
    @order_item = current_order.order_items.new
  end

  def kids
    @products = Product.where(age_group: 'k', enabled: 1)
    @order_item = current_order.order_items.new
  end
end
