class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 255
      t.string :short_description, limit: 255
      t.text :long_description
      t.decimal :cost, precision: 9, scale: 2
      t.decimal :price, precision: 9, scale: 2
      t.text :keywords
      t.integer :legacy_id
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
