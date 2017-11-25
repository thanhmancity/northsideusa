class AddColSizeToSize < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :size, :string
  end
end
