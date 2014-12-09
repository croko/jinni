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

ActiveRecord::Schema.define(version: 20141209160841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "phone_number"
    t.string   "mobile_1"
    t.string   "mobile_2"
    t.integer  "city_id"
    t.string   "address_1"
    t.string   "address_2"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "email"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foundations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "description"
  end

  create_table "payment_gateways", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_systems", force: true do |t|
    t.string   "name"
    t.integer  "foundation_id"
    t.integer  "user_id"
    t.integer  "payment_gateway_id"
    t.string   "public_key"
    t.string   "private_key"
    t.boolean  "active",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_systems", ["foundation_id"], name: "index_payment_systems_on_foundation_id", using: :btree
  add_index "payment_systems", ["payment_gateway_id"], name: "index_payment_systems_on_payment_gateway_id", using: :btree
  add_index "payment_systems", ["user_id"], name: "index_payment_systems_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "goal"
    t.text     "about"
    t.integer  "user_id"
    t.integer  "foundation_id"
    t.integer  "payment_system_id"
    t.integer  "status"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "category_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_image"
    t.string   "location"
    t.json     "main_images"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["foundation_id"], name: "index_projects_on_foundation_id", using: :btree
  add_index "projects", ["payment_system_id"], name: "index_projects_on_payment_system_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "with_foundation",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
