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

ActiveRecord::Schema.define(:version => 20121010214627) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "cost"
    t.string   "details"
    t.datetime "start_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "activities", ["cost"], :name => "index_activities_on_cost"
  add_index "activities", ["name"], :name => "index_activities_on_name"
  add_index "activities", ["start_at"], :name => "index_activities_on_start_at"
  add_index "activities", ["type"], :name => "index_activities_on_type"

  create_table "activities_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "activity_id"
  end

  add_index "activities_users", ["activity_id"], :name => "index_activities_users_on_activity_id"
  add_index "activities_users", ["user_id"], :name => "index_activities_users_on_user_id"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.binary   "crypted_password"
    t.string   "uid"
    t.string   "provider"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "remember_token"
    t.boolean  "admin",                        :default => false
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["end_at"], :name => "index_users_on_end_at"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["provider"], :name => "index_users_on_provider"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["start_at"], :name => "index_users_on_start_at"
  add_index "users", ["uid"], :name => "index_users_on_uid"

end
