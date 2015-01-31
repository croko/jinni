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

ActiveRecord::Schema.define(version: 20150131175228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "phone_number",     limit: 255
    t.string   "mobile_1",         limit: 255
    t.string   "mobile_2",         limit: 255
    t.integer  "city_id"
    t.string   "address_1",        limit: 255
    t.string   "address_2",        limit: 255
    t.integer  "addressable_id"
    t.string   "addressable_type", limit: 255
    t.string   "email",            limit: 255
    t.string   "website_url",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agreements", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "provider",     limit: 255, null: false
    t.string   "uid",          limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_url",   limit: 255
    t.string   "access_token"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "projects_count"
    t.string   "slug",           limit: 255
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foundations", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.text     "description"
    t.boolean  "featured",                 default: false
    t.string   "logo"
    t.string   "website_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "google_url"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "payment_gateways", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_systems", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "foundation_id"
    t.integer  "user_id"
    t.integer  "payment_gateway_id"
    t.string   "public_key",         limit: 255
    t.string   "private_key",        limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_systems", ["foundation_id"], name: "index_payment_systems_on_foundation_id", using: :btree
  add_index "payment_systems", ["payment_gateway_id"], name: "index_payment_systems_on_payment_gateway_id", using: :btree
  add_index "payment_systems", ["user_id"], name: "index_payment_systems_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "payment_gateway_id"
    t.string   "sender_phone",        limit: 255
    t.string   "payment_transaction", limit: 255
    t.string   "payment_status",      limit: 255
    t.string   "payment_type",        limit: 255
    t.string   "liqpay_order_id",     limit: 255
    t.decimal  "commission",                      precision: 8, scale: 2, default: 0.0
    t.string   "currency",            limit: 255
    t.decimal  "amount",                          precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount_currency",                 precision: 8, scale: 2, default: 0.0
    t.decimal  "exchange_rate",                   precision: 8, scale: 4, default: 1.0
    t.string   "comment"
  end

  add_index "payments", ["payment_gateway_id"], name: "index_payments_on_payment_gateway_id", using: :btree
  add_index "payments", ["project_id"], name: "index_payments_on_project_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "main_image", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
  end

  add_index "photos", ["project_id"], name: "index_photos_on_project_id", using: :btree
  add_index "photos", ["report_id"], name: "index_photos_on_report_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "goal",              limit: 255
    t.text     "about"
    t.integer  "user_id"
    t.integer  "foundation_id"
    t.integer  "payment_system_id"
    t.integer  "status",                                                default: 0
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "category_id"
    t.decimal  "amount",                        precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",          limit: 255
    t.boolean  "featured",                                              default: false
    t.boolean  "published",                                             default: false
    t.boolean  "approved",                                              default: false
    t.string   "slug",              limit: 255
    t.decimal  "collected",                     precision: 8, scale: 2, default: 0.0
    t.integer  "payments_count"
    t.boolean  "share",                                                 default: true
    t.boolean  "shared",                                                default: false
    t.boolean  "fixed_price",                                           default: false
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["foundation_id"], name: "index_projects_on_foundation_id", using: :btree
  add_index "projects", ["payment_system_id"], name: "index_projects_on_payment_system_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "goal",       limit: 255
    t.text     "about"
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["project_id"], name: "index_reports_on_project_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "terms", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           limit: 255,                 null: false
    t.string   "crypted_password",                limit: 255
    t.string   "salt",                            limit: 255
    t.string   "first_name",                      limit: 255
    t.string   "last_name",                       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token",               limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "with_foundation",                             default: false
    t.boolean  "admin",                                       default: false
    t.text     "about"
    t.string   "image",                           limit: 255
    t.string   "twitter_url",                     limit: 255
    t.string   "facebook_url",                    limit: 255
    t.string   "google_url",                      limit: 255
    t.integer  "projects_count",                              default: 0
    t.boolean  "publish",                                     default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
