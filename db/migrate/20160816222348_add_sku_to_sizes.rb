class AddSkuToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :sku, :string, :limit => 100
    add_column :sizes, :width, :string, :limit => 50
    add_column :sizes, :has_stock, :boolean
    add_column :sizes, :inventory, :integer
    add_column :sizes, :size_type, :integer
  end
end
