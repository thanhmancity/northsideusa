class AddColumnParentIdToSubCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_categories, :parent_id, :integer
  end
end
