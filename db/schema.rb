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

ActiveRecord::Schema.define(version: 20161122195912) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "fridays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "issue_number"
    t.string   "week"
    t.binary   "main_image"
    t.string   "moon_phase"
    t.text     "welcome"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "mondays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "numbers", force: :cascade do |t|
    t.integer  "number"
    t.text     "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "podcast_details", force: :cascade do |t|
    t.string   "title"
    t.binary   "image"
    t.string   "link"
    t.integer  "podcast_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "entry"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string   "title"
    t.binary   "main_image"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "date"
  end

  create_table "saturdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sidebars", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.binary   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "issue_id"
    t.integer  "podcast_link_id"
  end

  create_table "sundays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "thursdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tuesdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wednesdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
