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

ActiveRecord::Schema.define(version: 2019_06_04_094701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.date "date"
    t.float "latitude"
    t.float "longitude"
    t.string "category"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.integer "limit"
    t.bigint "owner_id"
    t.string "name"
    t.index ["owner_id"], name: "index_activities_on_owner_id"
    t.index ["place_id"], name: "index_activities_on_place_id"
  end

  create_table "activity_photos", force: :cascade do |t|
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["activity_id"], name: "index_activity_photos_on_activity_id"
  end

  create_table "activity_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_reviews_on_activity_id"
    t.index ["user_id"], name: "index_activity_reviews_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "photo"
    t.text "my_story"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_favorites_on_activity_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_guests_on_activity_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "amount_cents", default: 0, null: false
    t.string "status"
    t.bigint "user_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_orders_on_activity_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "place_photos", force: :cascade do |t|
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["place_id"], name: "index_place_photos_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "category"
    t.integer "dogginess_scale"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "places"
  add_foreign_key "activities", "users", column: "owner_id"
  add_foreign_key "activity_photos", "activities"
  add_foreign_key "activity_reviews", "activities"
  add_foreign_key "activity_reviews", "users"
  add_foreign_key "dogs", "users"
  add_foreign_key "favorites", "activities"
  add_foreign_key "favorites", "users"
  add_foreign_key "guests", "activities"
  add_foreign_key "guests", "users"
  add_foreign_key "orders", "activities"
  add_foreign_key "orders", "users"
  add_foreign_key "place_photos", "places"
  add_foreign_key "places", "users"
end
