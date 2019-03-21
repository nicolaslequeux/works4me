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

ActiveRecord::Schema.define(version: 2019_03_21_130452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.jsonb "payload"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_payments_on_task_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_reviews_on_task_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.string "address"
    t.string "status", default: "pending"
    t.string "picture"
    t.integer "owner_user_id"
    t.integer "worker_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "price_cents", default: 0, null: false
    t.index ["owner_user_id"], name: "index_tasks_on_owner_user_id"
    t.index ["worker_user_id"], name: "index_tasks_on_worker_user_id"
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
    t.text "address"
    t.string "phone_number"
    t.string "avatar"
    t.boolean "is_available", default: false
    t.float "latitude"
    t.float "longitude"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payments", "tasks"
  add_foreign_key "reviews", "tasks"
  add_foreign_key "reviews", "users"
end
