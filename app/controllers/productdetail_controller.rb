class ProductdetailController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @sizes = Size.where(product_color_id: @product.id)
    @order_item = current_order.order_items.new
  end
end
