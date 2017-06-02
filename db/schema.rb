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

ActiveRecord::Schema.define(version: 20170601112415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "amount"
    t.date     "bill_date"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.date     "b_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id", using: :btree
    t.index ["patient_id"], name: "index_bookings_on_patient_id", using: :btree
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "d_name"
    t.string   "d_gender"
    t.string   "d_address"
    t.string   "d_mobno"
    t.string   "d_specialize"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "pasword"
    t.string   "email"
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "medicine_name"
    t.float    "price"
    t.string   "company_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "p_name"
    t.string   "p_gender"
    t.string   "p_address"
    t.integer  "p_age"
    t.string   "p_mobno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptn_details", force: :cascade do |t|
    t.integer  "prescriptn_id"
    t.string   "medicine_name"
    t.integer  "medicine_count"
    t.integer  "days"
    t.integer  "tyms"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["prescriptn_id"], name: "index_prescriptn_details_on_prescriptn_id", using: :btree
  end

  create_table "prescriptns", force: :cascade do |t|
    t.date     "pres_date"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.string   "patient_reason"
    t.integer  "medicine_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["doctor_id"], name: "index_prescriptns_on_doctor_id", using: :btree
    t.index ["medicine_id"], name: "index_prescriptns_on_medicine_id", using: :btree
    t.index ["patient_id"], name: "index_prescriptns_on_patient_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "bookings", "doctors"
  add_foreign_key "bookings", "patients"
  add_foreign_key "prescriptn_details", "prescriptns"
  add_foreign_key "prescriptns", "doctors"
  add_foreign_key "prescriptns", "medicines"
  add_foreign_key "prescriptns", "patients"
end
