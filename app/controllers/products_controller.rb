class ProductsController < ApplicationController
  def index
    @products = Product.joins("INNER JOIN product_colors ON products.id = product_colors.product_id").order(:name).where(enabled: 1)
    @order_item = current_order.order_items.new
  end

  def show
    @products = Product.find(params[:id])
  end

  def men
    @products = Product.joins("INNER JOIN product_colors ON products.id = product_colors.product_id").order(:name).where(gender: 'm', age_group: 'a', enabled: 1)
    @order_item = current_order.order_items.new
  end

  def women
    @products = Product.joins("INNER JOIN product_colors ON products.id = product_colors.product_id").order(:name).where(gender: 'f', age_group: 'a', enabled: 1)
    @order_item = current_order.order_items.new
  end

  def kids
    @products = Product.joins("INNER JOIN product_colors ON products.id = product_colors.product_id").order(:name).where(age_group: 'k', enabled: 1)
    @order_item = current_order.order_items.new
  end
end
