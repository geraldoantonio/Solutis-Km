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

ActiveRecord::Schema.define(version: 2018_10_30_234019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "cep"
    t.string "address"
    t.string "city"
    t.integer "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "geolocalization"
    t.bigint "functionary_id"
    t.index ["functionary_id"], name: "index_addresses_on_functionary_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "plate"
    t.string "mark"
    t.string "modelType"
    t.bigint "functionary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "km", default: 0
    t.index ["functionary_id"], name: "index_cars_on_functionary_id"
  end

  create_table "displacements", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "functionary_id"
    t.date "dateDay"
    t.integer "osNumber"
    t.integer "osProject"
    t.time "startHour"
    t.time "endHour"
    t.bigint "addressSrc_id"
    t.bigint "addressDst_id"
    t.integer "kmStart"
    t.integer "kmEnd"
    t.integer "kmCount"
    t.text "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "velocity", default: 0.0
    t.index ["addressDst_id"], name: "index_displacements_on_addressDst_id"
    t.index ["addressSrc_id"], name: "index_displacements_on_addressSrc_id"
    t.index ["car_id"], name: "index_displacements_on_car_id"
    t.index ["functionary_id"], name: "index_displacements_on_functionary_id"
  end

  create_table "functionaries", force: :cascade do |t|
    t.string "matriculation"
    t.string "name"
    t.integer "function"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leader"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_functionaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "functionaries"
  add_foreign_key "cars", "functionaries"
  add_foreign_key "displacements", "addresses", column: "addressDst_id"
  add_foreign_key "displacements", "addresses", column: "addressSrc_id"
  add_foreign_key "displacements", "cars"
  add_foreign_key "displacements", "functionaries"
  add_foreign_key "functionaries", "users"
end
