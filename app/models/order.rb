class Order < ActiveRecord::Base
  # associations
  belongs_to :order_status
  has_many :order_items
  has_one :order_shippings
  has_one :order_billings
  has_one :order_payments

  # callbacks
  before_create :set_order_status
  before_save :update_values

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price - (oi.discount || 0)) : 0 }.sum
  end

  def total_quantity
    order_items.collect { |oi| oi.valid? ? oi.quantity : 0 }.sum
  end

  def shipping
    subtotal > 99.99 ? 0 : (total_quantity * 5) - (shipping_discount || 0)
  end

  def pre_tax
    subtotal > 0 ? subtotal + shipping : subtotal
  end

  def tax
    0
  end

  def total
    pre_tax + tax
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_values
    self[:subtotal] = subtotal
    self[:tax] = tax
    self[:shipping] = shipping
    self[:total] = total
  end
end
