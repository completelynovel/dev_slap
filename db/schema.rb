# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100402183055) do

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_login_at"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "normal_picture_file_name"
    t.string   "normal_picture_content_type"
    t.integer  "normal_picture_file_size"
    t.datetime "normal_picture_updated_at"
    t.string   "slapped1_picture_file_name"
    t.string   "slapped1_picture_content_type"
    t.integer  "slapped1_picture_file_size"
    t.datetime "slapped1_picture_updated_at"
  end

  create_table "person_session", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slappers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "apology"
    t.text     "feedback"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slaps", :force => true do |t|
    t.integer  "person_id"
    t.integer  "slapper_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "website_people", :force => true do |t|
    t.integer "person_id"
    t.integer "website_id"
  end

  add_index "website_people", ["person_id"], :name => "index_website_people_on_person_id"
  add_index "website_people", ["website_id"], :name => "index_website_people_on_website_id"

  create_table "websites", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
