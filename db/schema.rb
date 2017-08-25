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

ActiveRecord::Schema.define(version: 20170825083943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accessorizations", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "accessory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_accessorizations_on_accessory_id"
    t.index ["car_id"], name: "index_accessorizations_on_car_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_profiles", force: :cascade do |t|
    t.bigint "car_id"
    t.date "road_tax_expired_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plate_number"
    t.string "chasis_number"
    t.date "last_service"
    t.index ["car_id"], name: "index_car_profiles_on_car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "company_profile_id"
    t.bigint "brand_id"
    t.bigint "model_id"
    t.decimal "price_hourly", precision: 8, scale: 2
    t.decimal "price_daily", precision: 8, scale: 2
    t.decimal "price_weekly", precision: 8, scale: 2
    t.decimal "price_monthly", precision: 8, scale: 2
    t.integer "status", default: 0, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_cars_on_brand_id"
    t.index ["company_profile_id"], name: "index_cars_on_company_profile_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "pic_fullname"
    t.string "pic_phone_number"
    t.string "pic_position"
    t.string "pic_email"
    t.string "c_name"
    t.string "c_reg_number"
    t.text "c_address"
    t.string "c_city"
    t.string "c_postcode"
    t.string "c_state"
    t.string "c_country"
    t.string "c_phone_number"
    t.string "c_website"
    t.string "c_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "c_profile_picture"
    t.index ["c_name"], name: "index_company_profiles_on_c_name", unique: true
    t.index ["c_reg_number"], name: "index_company_profiles_on_c_reg_number", unique: true
    t.index ["slug"], name: "index_company_profiles_on_slug", unique: true
    t.index ["user_id"], name: "index_company_profiles_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "models", force: :cascade do |t|
    t.bigint "brand_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_models_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "accessorizations", "accessories"
  add_foreign_key "accessorizations", "cars"
  add_foreign_key "car_profiles", "cars"
  add_foreign_key "cars", "brands"
  add_foreign_key "cars", "company_profiles"
  add_foreign_key "cars", "models"
  add_foreign_key "company_profiles", "users"
  add_foreign_key "models", "brands"
end
