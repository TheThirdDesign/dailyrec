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

ActiveRecord::Schema.define(version: 20150316163931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "password_digest"
    t.text     "adminname"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "name"
    t.text     "message"
    t.integer  "post_id"
    t.integer  "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drafts", force: :cascade do |t|
    t.text     "title"
    t.text     "category"
    t.text     "date"
    t.text     "content"
    t.text     "layout"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "pictures",   default: [],              array: true
    t.text     "teaser"
    t.integer  "admin_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "draft_id"
    t.integer  "post_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["draft_id"], name: "index_images_on_draft_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchusers", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "specialty"
    t.text     "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "title"
    t.text     "category"
    t.text     "date"
    t.text     "content"
    t.text     "pictures",   default: [],              array: true
    t.text     "layout"
    t.text     "teaser"
    t.integer  "admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "name"
    t.text     "email"
    t.text     "message"
  end

end
