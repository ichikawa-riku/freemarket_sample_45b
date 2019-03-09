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

ActiveRecord::Schema.define(version: 20190309081220) do

  create_table "adresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "zip_code",   null: false
    t.integer  "area_id",    null: false
    t.string   "city",       null: false
    t.string   "adress1",    null: false
    t.string   "adress2"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_adresses_on_area_id", using: :btree
    t.index ["user_id"], name: "index_adresses_on_user_id", using: :btree
  end

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "prefecture", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "product_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "size", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.text     "description",     limit: 65535, null: false
    t.integer  "price",                         null: false
    t.integer  "area_id",                       null: false
    t.integer  "condition",                     null: false
    t.integer  "product_size_id",               null: false
    t.integer  "brand_id",                      null: false
    t.integer  "shipping_method",               null: false
    t.integer  "shipping_burden",               null: false
    t.integer  "estimated_date",                null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["area_id"], name: "index_products_on_area_id", using: :btree
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["product_size_id"], name: "index_products_on_product_size_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "family_name",      null: false
    t.string   "first_name",       null: false
    t.string   "family_name_kana", null: false
    t.string   "first_name_kana",  null: false
    t.integer  "birth_year",       null: false
    t.integer  "birth_month",      null: false
    t.integer  "birth_day",        null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                             null: false
    t.string   "email",                                null: false
    t.text     "introduction",           limit: 65535
    t.string   "encrypted_password",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["nickname"], name: "index_users_on_nickname", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

  add_foreign_key "adresses", "areas"
  add_foreign_key "adresses", "users"
  add_foreign_key "products", "areas"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "product_sizes"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
end
