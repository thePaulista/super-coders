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

ActiveRecord::Schema.define(version: 20160427174625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "coders", force: :cascade do |t|
    t.string  "name"
    t.string  "experience"
    t.string  "image_url"
    t.string  "cost"
    t.integer "category_id"
    t.boolean "active",      default: true
  end

  add_index "coders", ["category_id"], name: "index_coders_on_category_id", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "status",     default: "Contracted"
  end

  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree

  create_table "teammates", force: :cascade do |t|
    t.integer "coder_id"
    t.integer "contract_id"
    t.string  "cost"
  end

  add_index "teammates", ["coder_id"], name: "index_teammates_on_coder_id", using: :btree
  add_index "teammates", ["contract_id"], name: "index_teammates_on_contract_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "organization"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "coders", "categories"
  add_foreign_key "contracts", "users"
  add_foreign_key "teammates", "coders"
  add_foreign_key "teammates", "contracts"
end
