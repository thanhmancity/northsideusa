class CheckoutController < ApplicationController
  def show
    @order = current_order
  end
  def shipping
  end

  def billing
  end

  def delivery
  end

  def payment
  end

  def review
  end
end
