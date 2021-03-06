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

ActiveRecord::Schema.define(version: 2022_04_21_001636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "operation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["operation_id"], name: "index_messages_on_operation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "requested_money"
    t.decimal "buying_price"
    t.decimal "appraisal_price"
    t.integer "years_duration"
    t.integer "year_of_birth"
    t.decimal "annual_gross_income"
    t.string "city"
    t.string "name"
    t.string "interest_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reference_id"
    t.bigint "user_id", null: false
    t.decimal "ltv_appraisal"
    t.decimal "ltv_buying"
    t.decimal "stress_test"
    t.integer "status"
    t.string "phone_number"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "operations"
  add_foreign_key "messages", "users"
  add_foreign_key "operations", "users"
end
