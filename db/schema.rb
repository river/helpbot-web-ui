# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 5) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "name"
    t.string   "hashed_password"
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "admins_channels", :id => false, :force => true do |t|
    t.integer "admin_id"
    t.integer "channel_id"
  end

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.boolean  "channel_wins"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "admin_id"
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
