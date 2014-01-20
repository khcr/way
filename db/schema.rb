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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140107095541) do

  create_table "events", :force => true do |t|
    t.string   "theme"
    t.string   "president"
    t.string   "remarque"
    t.string   "orateur"
    t.date     "date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "image_id"
    t.text     "info"
    t.integer  "type_events_id"
    t.string   "slug"
  end

  add_index "events", ["date"], :name => "index_events_on_date"
  add_index "events", ["slug"], :name => "index_events_on_slug"

  create_table "forms", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "vendredi_soir"
    t.string   "vendredi_nuit"
    t.string   "samedi_midi"
    t.string   "samedi_soir"
    t.string   "samedi_nuit"
    t.string   "dimanche_midi"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.date     "date"
    t.boolean  "isPrivate"
    t.string   "key"
  end

  add_index "galleries", ["slug"], :name => "index_galleries_on_slug"

  create_table "images", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "levels", :force => true do |t|
    t.integer  "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "adress"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "date_exp"
    t.text     "content"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.text     "content"
  end

  create_table "paintings", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
    t.text     "content"
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug"

  create_table "slideshows", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.date     "date_exp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "level_id"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
