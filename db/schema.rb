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

ActiveRecord::Schema.define(version: 20160708155313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "profiles", force: :cascade do |t|
    t.string  "email",        limit: 80
    t.integer "companies_id",            null: false
    t.string  "first_name",   limit: 80
    t.string  "last_name",    limit: 80
    t.string  "gender",       limit: 8
    t.string  "locale",       limit: 80
  end

  add_index "profiles", ["companies_id", "first_name", "last_name"], name: "uk_profiles_name", unique: true, using: :btree

  add_foreign_key "profiles", "companies", column: "companies_id", name: "fk_profiles_companies_id"
end
