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

ActiveRecord::Schema[8.0].define(version: 2025_01_08_011453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "habit_list_items", force: :cascade do |t|
    t.bigint "habit_list_id", null: false
    t.uuid "habit_id"
    t.boolean "habit_is_completed", default: false
    t.boolean "is_late", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_list_id"], name: "index_habit_list_items_on_habit_list_id"
  end

  create_table "habit_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "list_owner_id", null: false
    t.integer "completed_habits", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_owner_id"], name: "index_habit_lists_on_list_owner_id"
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
    t.integer "level", default: 1
    t.integer "current_xp", default: 0
    t.integer "xp_to_next_level", default: 100
    t.integer "habits_completed", default: 0
    t.integer "max_hp", default: 50
    t.integer "hp", default: 50
    t.integer "streak", default: 0
    t.integer "total_login_count", default: 0
    t.datetime "last_login", default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "habit_list_items", "habit_lists"
  add_foreign_key "habit_lists", "users", column: "list_owner_id"
end
