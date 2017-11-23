class AddColGenderSubCate < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_categories, :gender, :string, null: false
    add_column :sub_categories, :age_group, :string, null: false
  end
end
