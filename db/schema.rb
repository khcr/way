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

ActiveRecord::Schema.define(version: 20150307171321) do

  create_table "events", force: true do |t|
    t.date     "date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "content"
    t.boolean  "remove",     default: false
    t.boolean  "replace",    default: false
  end

  add_index "events", ["date"], name: "index_events_on_date"

  create_table "forms", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notice"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
    t.boolean  "isprivate"
  end

  create_table "images", force: true do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date_exp"
    t.text     "content"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.text     "content"
  end

  create_table "paintings", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
  end

  create_table "slideshows", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.date     "date_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "level"
  end

end
