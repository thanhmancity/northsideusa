class AddColTagSubCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_categories, :tag, :string, null: false
  end
end