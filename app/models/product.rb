class Product < ActiveRecord::Base
  # associations
  has_many   :order_items
  has_many   :product_colors
  has_many   :color_families, through: :product_colors
  has_many   :sizes
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :sub_category

  default_scope { where(enabled: true) }

  scope :by_sub_cate, ->sub_category_id{where sub_category_id: sub_category_id}
  scope :by_age_group_and_gender, ->age_group, gender{where age_group: age_group, gender: gender}
end
