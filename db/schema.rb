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

ActiveRecord::Schema.define(:version => 20110331071154) do

  create_table "account_informations", :force => true do |t|
    t.integer  "user_id"
    t.string   "nume"
    t.string   "prenume"
    t.integer  "promotia"
    t.string   "adresa"
    t.string   "email"
    t.string   "specializare"
    t.string   "domeniucurent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cariera"
    t.integer  "mentor"
  end

  create_table "alumni", :force => true do |t|
    t.text    "nume",                  :null => false
    t.text    "prenume",               :null => false
    t.integer "promotia",              :null => false
    t.text    "mail",                  :null => false
    t.text    "adresa",                :null => false
    t.text    "domeniu",               :null => false
    t.integer "mentor",   :limit => 1, :null => false
    t.integer "cariera",  :limit => 1, :null => false
    t.text    "data",                  :null => false
  end

  add_index "alumni", ["id"], :name => "id", :unique => true

  create_table "alumnis", :force => true do |t|
    t.string  "nume"
    t.string  "prenume"
    t.integer "promotia"
    t.string  "mail"
    t.text    "adresa"
    t.string  "domeniu"
    t.boolean "mentor"
    t.boolean "cariera"
    t.string  "data"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.string   "sent_from"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "r",          :limit => 1, :default => 0
    t.integer  "sender_id"
  end

  create_table "sugestii", :force => true do |t|
    t.text "sugestie", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "role"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workshopregs", :force => true do |t|
    t.string   "nume"
    t.string   "clasa"
    t.integer  "opt1"
    t.integer  "opt2"
    t.integer  "opt3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opt4"
    t.string   "email"
  end

end
