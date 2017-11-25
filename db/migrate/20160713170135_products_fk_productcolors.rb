class ProductsFkProductcolors < ActiveRecord::Migration
  def change
    add_column :sizes, :product_color_id, :integer
  end
end
