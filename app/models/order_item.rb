class OrderItem < ActiveRecord::Base
  # associations
  belongs_to :product
  belongs_to :product_color
  belongs_to :size
  belongs_to :order

  # validation
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  # callbacks
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  def item_gender
    # gender = Product.where(id: product.id).pluck(:gender).at(0)
    # age_group = Product.where(id: product.id).pluck(:age_group).at(0)
    gender = product.gender
    age_group = product.age_group
    case gender
    when "m"
      case age_group
      when "a"
        display_gender = "Men's"
      when "k"
        display_gender = "Boys'"
      end
    when "f"
      case age_group
      when "a"
        display_gender = "Women's"
      when "k"
        display_gender = "Girls'"
      end
    when "u"
      case age_group
      when "a"
        display_gender = "Adult's"
      when "k"
        display_gender = "Kids'"
      end
    end
    return display_gender
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
