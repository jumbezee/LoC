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

ActiveRecord::Schema.define(version: 20160710110215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string "name",    limit: 80
    t.string "city",    limit: 80
    t.string "country", limit: 80
  end

  add_index "companies", ["name"], name: "uk_companies_name", unique: true, using: :btree

  create_table "employees", force: :cascade do |t|
    t.string "email", limit: 80
  end

  add_index "employees", ["email"], name: "uk_employees_name", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.integer "company_id",                null: false
    t.string  "title",         limit: 80
    t.text    "path_to_image"
    t.string  "description",   limit: 250
    t.integer "price"
  end

  add_index "products", ["company_id", "title", "description"], name: "uk_products_name", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string  "email",      limit: 80
    t.integer "company_id",            null: false
    t.string  "first_name", limit: 80
    t.string  "last_name",  limit: 80
    t.string  "gender",     limit: 8
    t.string  "locale",     limit: 80
  end

  add_index "profiles", ["company_id", "first_name", "last_name"], name: "uk_profiles_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "products", "companies", name: "fk_products_company"
  add_foreign_key "profiles", "companies", name: "fk_profiles_company"
end
