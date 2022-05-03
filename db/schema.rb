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

ActiveRecord::Schema[7.0].define(version: 2022_05_02_133803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_plan_changes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_subscription_id"
    t.datetime "plan_change_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_subscription_items", force: :cascade do |t|
    t.string "item_price_id"
    t.string "item_type"
    t.integer "quantity"
    t.string "unit_price"
    t.decimal "amount"
    t.integer "free_quantity"
    t.string "object"
    t.integer "user_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.string "subscription_id"
    t.string "billing_period"
    t.string "billing_period_unit"
    t.string "status"
    t.datetime "current_term_start"
    t.datetime "current_term_end"
    t.datetime "next_billing_at"
    t.datetime "activated_at"
    t.string "currency_code"
    t.string "channel"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "company", default: "", null: false
    t.string "taxability", default: "", null: false
    t.string "customer_id", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
