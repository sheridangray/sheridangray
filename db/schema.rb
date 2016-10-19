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

ActiveRecord::Schema.define(version: 20161019195206) do

  create_table "clothing_items", force: :cascade do |t|
    t.date     "purchased_on"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "expected_months_to_expire"
    t.integer  "wardrobe_id"
    t.integer  "clothing_type_id"
  end

  add_index "clothing_items", ["clothing_type_id"], name: "index_clothing_items_on_clothing_type_id"
  add_index "clothing_items", ["wardrobe_id"], name: "index_clothing_items_on_wardrobe_id"

  create_table "clothing_type_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sort_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clothing_types", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "sort_order"
    t.integer "clothing_type_category_id"
    t.string  "image_url"
    t.integer "expected_months_to_expire"
  end

  add_index "clothing_types", ["clothing_type_category_id"], name: "index_clothing_types_on_clothing_type_category_id"

  create_table "ideal_wardrobe_items", force: :cascade do |t|
    t.integer "amount"
    t.integer "clothing_type_id"
    t.integer "style_id"
  end

  add_index "ideal_wardrobe_items", ["clothing_type_id"], name: "index_ideal_wardrobe_items_on_clothing_type_id"
  add_index "ideal_wardrobe_items", ["style_id"], name: "index_ideal_wardrobe_items_on_style_id"

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sort_order"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wardrobes", force: :cascade do |t|
    t.integer  "style_id"
    t.integer  "annual_income"
    t.integer  "family_size"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "monthly_budget"
    t.integer  "workouts"
  end

  add_index "wardrobes", ["style_id"], name: "index_wardrobes_on_style_id"
  add_index "wardrobes", ["user_id"], name: "index_wardrobes_on_user_id"

end
