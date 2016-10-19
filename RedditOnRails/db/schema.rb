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

ActiveRecord::Schema.define(version: 20161019182623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_subs", force: :cascade do |t|
    t.string   "sub_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  add_index "post_subs", ["sub_id"], name: "index_post_subs_on_sub_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  create_table "subs", force: :cascade do |t|
    t.string   "sub_name",     null: false
    t.text     "description",  null: false
    t.integer  "moderator_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["sub_name"], name: "index_subs_on_sub_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
