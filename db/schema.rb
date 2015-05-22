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

ActiveRecord::Schema.define(version: 20150522034521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shows", force: :cascade do |t|
    t.string   "title",                limit: 255,                 null: false
    t.string   "domain",                                           null: false
    t.string   "subtitle",             limit: 255,                 null: false
    t.text     "description",                                      null: false
    t.string   "language",                                         null: false
    t.string   "category",                                         null: false
    t.string   "subcategory"
    t.string   "owner_name",           limit: 255
    t.string   "owner_email",          limit: 255
    t.boolean  "explicit",                         default: false, null: false
    t.string   "livestream_embed_url"
    t.string   "irc_embed_url"
    t.string   "irc_room"
    t.string   "irc_username"
    t.boolean  "enabled",                          default: false, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "shows", ["domain"], name: "index_shows_on_domain", unique: true, using: :btree
  add_index "shows", ["title"], name: "index_shows_on_title", unique: true, using: :btree

  create_table "user_show_associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.boolean  "is_owner",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_show_associations", ["show_id"], name: "index_user_show_associations_on_show_id", using: :btree
  add_index "user_show_associations", ["user_id", "show_id"], name: "index_user_show_associations_on_user_id_and_show_id", unique: true, using: :btree
  add_index "user_show_associations", ["user_id"], name: "index_user_show_associations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "user_show_associations", "shows"
  add_foreign_key "user_show_associations", "users"
end
