# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171124032261) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "tag"
    t.integer  "display",    default: 0
  end

  create_table "color_families", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "color_family", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email_address"
    t.text     "message",         limit: 4294967295
    t.datetime "submission_date"
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "order_billings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.string   "bill_first_name"
    t.string   "bill_last_name"
    t.string   "bill_address1"
    t.string   "bill_address2"
    t.string   "bill_city"
    t.string   "bill_state"
    t.string   "bill_zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "order_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",       precision: 9, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price",      precision: 9, scale: 2
    t.decimal  "discount",         precision: 9, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "product_color_id",                         null: false
    t.integer  "size_id"
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "order_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.string   "order_transaction_id"
    t.string   "order_approval_code"
    t.integer  "last_four"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "order_shippings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.string   "ship_first_name"
    t.string   "ship_last_name"
    t.string   "email_address"
    t.string   "phone"
    t.string   "ship_address1"
    t.string   "ship_address2"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "order_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "order_trackings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "carrier"
    t.string   "tracking_number"
    t.datetime "date_shipped"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "subtotal",          precision: 9, scale: 2
    t.decimal  "tax",               precision: 9, scale: 2
    t.decimal  "shipping",          precision: 9, scale: 2
    t.decimal  "discount",          precision: 9, scale: 2
    t.decimal  "shipping_discount", precision: 9, scale: 2
    t.decimal  "total",             precision: 9, scale: 2
    t.integer  "order_status_id"
    t.string   "tracking_number"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "color_family_id"
    t.string   "color"
    t.integer  "enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "short_description"
    t.string   "gender",                                                  default: "u"
    t.string   "age_group",                                               default: "a"
    t.text     "long_description",  limit: 65535
    t.decimal  "cost",                            precision: 9, scale: 2
    t.decimal  "price",                           precision: 9, scale: 2
    t.text     "keywords",          limit: 65535
    t.integer  "legacy_id"
    t.boolean  "enabled"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  create_table "promos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "promo_type_id"
    t.string   "promo_code",    limit: 30
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "redeemed"
    t.datetime "redeemed_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.decimal  "unit_price",                   precision: 9, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price",                  precision: 9, scale: 2
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "product_color_id"
    t.string   "sku",              limit: 100
    t.string   "width",            limit: 50
    t.boolean  "has_stock"
    t.integer  "inventory"
    t.integer  "size_type"
    t.string   "size"
  end

  create_table "sub_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.string   "image"
    t.string   "tag",        null: false
    t.string   "gender",     null: false
    t.string   "age_group",  null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
end
