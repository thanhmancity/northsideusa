class ProductsController < ApplicationController
  before_action :remove_session

  # def show
  #   @products = Product.find(params[:id])
  # end

  # def index
  #   @products = Product.joins(:product_colors).order(:name).where(enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def active
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def hunting
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def lifestyle
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def slippers
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def sport
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def trail
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def watershoes
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def polar
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(enabled: 1).where('product_categories.category_id = 8 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men
  #   @products = Product.joins(:product_colors).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   #session[:product_ids] = @products.pluck(:id)
  #   filter if request.format.js?
  # end

  # def men_active
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men_hunting
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men_lifestyle
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men_slippers
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men_sport
  #   @products = Product.joins(:product_colors, :product_categories).order(:name)
  #     .where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   filter if request.format.js?
  # end

  # def men_trail
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   filter if request.format.js?
  # end

  # def men_watershoes
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def men_polar
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'm', age_group: 'a', enabled: 1).where('product_categories.category_id = 8 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women
  #   @products = Product.joins(:product_colors).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   session[:filter_type] = nil
  #   session[:product_ids] = @products.pluck(:id)
  #   filter if request.format.js?
  # end

  # def women_active
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women_hunting
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women_lifestyle
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women_slippers
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women_sport
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   session[:filter_type] = nil
  #   session[:product_ids] = @products.pluck(:id)
  #   filter if request.format.js?
  # end

  # def women_trail
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   session[:filter_type] = nil
  #   session[:product_ids] = @products.pluck(:id)
  #   filter if request.format.js?
  # end

  # def women_watershoes
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def women_polar
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(gender: 'f', age_group: 'a', enabled: 1).where('product_categories.category_id = 8 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids
  #   @products = Product.joins(:product_colors).order(:name).where(age_group: 'k', enabled: 1).where('product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   filter if request.format.js?
  # end

  # def kids_active
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 1 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids_hunting
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 2 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids_lifestyle
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 3 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids_slippers
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 4 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids_sport
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 5 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   filter if request.format.js?
  # end

  # def kids_trail
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 6 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  #   filter if request.format.js?
  # end

  # def kids_watershoes
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1).where('product_categories.category_id = 7 AND product_colors.enabled = 1').select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  # def kids_polar
  #   @products = Product.joins(:product_colors, :product_categories).order(:name).where(age_group: 'k', enabled: 1)
  #   .where('product_categories.category_id = 8 AND product_colors.enabled = 1')
  #   .select("products.*, product_colors.color, product_colors.id AS pcid")
  #   @order_item = current_order.order_items.new
  # end

  def reset_session_filter
    session[:filter_type] = nil
  end


  def get_products
    category = Category.friendly.find_by(tag: params[:category_tag])
    session[:sub_category] = SubCategory.find_by(tag: params[:sub_category_tag])
    if category
      @products = category.products
        .by_age_group_and_gender(session[:sub_category].age_group, Settings.genders[session[:sub_category].gender])
    elsif params[:category_tag].eql?("all")
      @products = Product.where(gender: Settings.genders[session[:sub_category].gender])
    end
    @order_item = current_order.order_items.new
    session[:filter_type] = nil
    session[:product_ids] = @products.pluck(:id) if request.format.html?
    filter if request.format.js?
  end

  private
  def remove_session
    session[:product_ids] = [] if !request.format.js?
  end
end
