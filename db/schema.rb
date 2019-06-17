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

ActiveRecord::Schema.define(version: 2019_06_17_160853) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "furniture_items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.integer "matched_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_furniture_items_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "traded"
  end

  create_table "images", force: :cascade do |t|
    t.string "photo"
    t.bigint "furniture_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["furniture_item_id"], name: "index_images_on_furniture_item_id"
  end

  create_table "swipes", force: :cascade do |t|
    t.boolean "liked"
    t.bigint "owned_furniture_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wanted_furniture_item_id"
    t.index ["owned_furniture_item_id"], name: "index_swipes_on_owned_furniture_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "avatar"
    t.integer "average_rating"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "furniture_items", "users"
  add_foreign_key "images", "furniture_items"
  add_foreign_key "swipes", "furniture_items", column: "owned_furniture_item_id"
  add_foreign_key "swipes", "furniture_items", column: "wanted_furniture_item_id"
end
