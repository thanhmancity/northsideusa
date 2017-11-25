class CreateColorFamilies < ActiveRecord::Migration
  def change
    create_table :color_families do |t|
      t.string :color_family, null: false

      t.timestamps null: false
    end
  end
end
