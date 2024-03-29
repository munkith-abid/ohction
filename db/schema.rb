# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_17_033600) do

  create_table "bids", force: :cascade do |t|
    t.float "amount", default: 0.0
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_bids_on_item_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "bulletings", force: :cascade do |t|
    t.string "bulleting"
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
  end

  create_table "item_details", force: :cascade do |t|
    t.integer "item_id"
    t.integer "image_id"
    t.integer "bulleting_id"
    t.index ["bulleting_id"], name: "index_item_details_on_bulleting_id"
    t.index ["image_id"], name: "index_item_details_on_image_id"
    t.index ["item_id"], name: "index_item_details_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.float "starting_price", default: 0.0
    t.float "minimum_price", default: 0.0
    t.float "current_price", default: 0.0
    t.datetime "start_time"
    t.datetime "end_time"
    t.float "shipping", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "buyer_id"
    t.integer "seller_id"
    t.string "status", default: "pending"
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "image"
  end

  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
end
