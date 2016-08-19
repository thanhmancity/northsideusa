class AddSkuToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :sku, :string, :limit => 100
  end
end
