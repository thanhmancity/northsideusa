# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160718224446) do

  create_table "categories", force: :cascade do |t|
    t.string "category", limit: 50
  end

  create_table "color_family", primary_key: "color_family_id", force: :cascade do |t|
    t.string "color_family", limit: 255
  end

  create_table "nsusa_posts", primary_key: "ID", force: :cascade do |t|
    t.integer  "post_author",           limit: 8,          default: 0,         null: false
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",         limit: 20,         default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.integer  "post_parent",           limit: 8,          default: 0,         null: false
    t.string   "guid",                  limit: 255,        default: "",        null: false
    t.integer  "menu_order",            limit: 4,          default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.integer  "comment_count",         limit: 8,          default: 0,         null: false
  end

  add_index "nsusa_posts", ["post_author"], name: "post_author", using: :btree
  add_index "nsusa_posts", ["post_name"], name: "post_name", length: {"post_name"=>191}, using: :btree
  add_index "nsusa_posts", ["post_parent"], name: "post_parent", using: :btree
  add_index "nsusa_posts", ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree

  create_table "nsusa_shopp_price", force: :cascade do |t|
    t.integer  "product",    limit: 8,                            default: 0,   null: false
    t.string   "context",    limit: 9,                                          null: false
    t.string   "type",       limit: 12,                                         null: false
    t.integer  "optionkey",  limit: 8,                            default: 0,   null: false
    t.string   "label",      limit: 255,                          default: "",  null: false
    t.string   "sku",        limit: 100,                          default: "",  null: false
    t.decimal  "price",                  precision: 16, scale: 6, default: 0.0, null: false
    t.decimal  "saleprice",              precision: 16, scale: 6, default: 0.0, null: false
    t.decimal  "promoprice",             precision: 16, scale: 6, default: 0.0, null: false
    t.decimal  "cost",                   precision: 16, scale: 6, default: 0.0, null: false
    t.decimal  "shipfee",                precision: 12, scale: 6, default: 0.0, null: false
    t.integer  "stock",      limit: 4,                            default: 0,   null: false
    t.integer  "stocked",    limit: 4,                            default: 0,   null: false
    t.string   "inventory",  limit: 3,                                          null: false
    t.string   "sale",       limit: 3,                                          null: false
    t.string   "shipping",   limit: 3,                                          null: false
    t.string   "tax",        limit: 3,                                          null: false
    t.string   "discounts",  limit: 255,                          default: "",  null: false
    t.integer  "sortorder",  limit: 4,                            default: 0,   null: false
    t.datetime "created",                                                       null: false
    t.datetime "modified",                                                      null: false
  end

  add_index "nsusa_shopp_price", ["context"], name: "context", using: :btree
  add_index "nsusa_shopp_price", ["product"], name: "product", using: :btree

  create_table "nsusa_term_relationships", id: false, force: :cascade do |t|
    t.integer "object_id",        limit: 8, default: 0, null: false
    t.integer "term_taxonomy_id", limit: 8, default: 0, null: false
    t.integer "term_order",       limit: 4, default: 0, null: false
  end

  add_index "nsusa_term_relationships", ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree

  create_table "nsusa_terms", primary_key: "term_id", force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group", limit: 8,   default: 0,  null: false
  end

  add_index "nsusa_terms", ["name"], name: "name", length: {"name"=>191}, using: :btree
  add_index "nsusa_terms", ["slug"], name: "slug", length: {"slug"=>191}, using: :btree

  create_table "order_billings", force: :cascade do |t|
    t.integer  "order_id",        limit: 4
    t.string   "bill_first_name", limit: 255
    t.string   "bill_last_name",  limit: 255
    t.string   "bill_address1",   limit: 255
    t.string   "bill_address2",   limit: 255
    t.string   "bill_city",       limit: 255
    t.string   "bill_state",      limit: 255
    t.string   "bill_zip",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",         limit: 4
    t.integer  "product_id",       limit: 4
    t.integer  "product_color_id", limit: 4
    t.decimal  "unit_price",                 precision: 9, scale: 2
    t.integer  "quantity",         limit: 4
    t.integer  "size_id",          limit: 4
    t.decimal  "total_price",                precision: 9, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_color_id"], name: "fk_rails_61cfedf519", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree
  add_index "order_items", ["size_id"], name: "fk_prderitems_sizes_idx", using: :btree

  create_table "order_shippings", force: :cascade do |t|
    t.integer  "order_id",        limit: 4
    t.string   "ship_first_name", limit: 255
    t.string   "ship_last_name",  limit: 255
    t.string   "email_address",   limit: 255
    t.string   "phone",           limit: 255
    t.string   "ship_address1",   limit: 255
    t.string   "ship_address2",   limit: 255
    t.string   "ship_city",       limit: 255
    t.string   "ship_state",      limit: 255
    t.string   "ship_zip",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                  precision: 9, scale: 2
    t.decimal  "tax",                       precision: 9, scale: 2
    t.decimal  "shipping",                  precision: 9, scale: 2
    t.decimal  "total",                     precision: 9, scale: 2
    t.integer  "order_status_id", limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "product", primary_key: "product_id", force: :cascade do |t|
    t.string   "product_name",      limit: 255
    t.string   "sku",               limit: 100
    t.string   "short_description", limit: 255
    t.text     "long_description",  limit: 65535
    t.decimal  "cost",                            precision: 9, scale: 2
    t.decimal  "price",                           precision: 9, scale: 2
    t.text     "keywords",          limit: 65535
    t.datetime "created_date"
    t.datetime "modified_date"
    t.binary   "enabled",           limit: 1
    t.integer  "legacy_id",         limit: 4
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_id",  limit: 4
    t.integer "category_id", limit: 4
  end

  create_table "product_colors", force: :cascade do |t|
    t.integer "product_id",      limit: 4
    t.integer "color_family_id", limit: 4
    t.string  "color",           limit: 100
    t.boolean "enabled",                     default: false
  end

  add_index "product_colors", ["product_id"], name: "fk_rails_36b75ac856", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "short_description", limit: 255
    t.text     "long_description",  limit: 65535
    t.decimal  "cost",                            precision: 9, scale: 2, default: 0.0
    t.decimal  "price",                           precision: 9, scale: 2
    t.string   "gender",            limit: 1
    t.string   "age_group",         limit: 1
    t.text     "keywords",          limit: 65535
    t.integer  "legacy_id",         limit: 4
    t.boolean  "enabled"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "product_color_id", limit: 4
    t.string  "size",             limit: 50
    t.string  "width",            limit: 50
    t.binary  "has_stock",        limit: 1
    t.integer "inventory",        limit: 4
    t.integer "size_type",        limit: 4,  default: 1
  end

  add_index "sizes", ["product_color_id"], name: "fk_rails_72a1897f16", using: :btree

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_colors"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "sizes", name: "fk_orderitems_sizes"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "product_colors", "products"
  add_foreign_key "sizes", "product_colors"
end
