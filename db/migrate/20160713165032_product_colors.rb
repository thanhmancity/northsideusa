class ProductColors < ActiveRecord::Migration[5.0]
  def change
    create_table :product_colors do |t|
      t.integer :product_id
      t.integer :color_family_id
      t.string :color
      t.integer :enabled

      t.timestamps null: false
    end
  end
end
