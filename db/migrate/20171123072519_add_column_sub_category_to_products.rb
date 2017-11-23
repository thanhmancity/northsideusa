class AddColumnSubCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sub_category_id, :integer
  end
end
