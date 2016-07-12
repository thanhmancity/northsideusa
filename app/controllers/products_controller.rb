class ProductsController < ApplicationController
  def index
    @products = Product.joins(:product_colors).order(:name).where(enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
    @order_item = current_order.order_items.new
  end

  def show
    @products = Product.find(params[:id])
  end

  def men
    @products = Product.joins(:product_colors).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_active
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_hunting
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_lifestyle
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_slippers
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_sport
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_trail
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def men_watershoes
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women
    @products = Product.joins(:product_colors).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_active
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_hunting
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_lifestyle
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_slippers
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_sport
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_trail
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def women_watershoes
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids
    @products = Product.joins(:product_colors).order(:name).where(age_group: 'k', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_active
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_hunting
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_lifestyle
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_slippers
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_sport
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_trail
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end

  def kids_watershoes
    @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color")
    @order_item = current_order.order_items.new
  end
end
