class AddColumnTagAndDisplayToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :tag, :string
    add_column :categories, :display, :integer, default: 0
  end
end
