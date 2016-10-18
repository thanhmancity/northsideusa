class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.integer :promo_type_id
      t.string :promo_code, limit: 30
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :redeemed
      t.datetime :redeemed_date

      t.timestamps null: false
    end
  end
end
