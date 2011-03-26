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

ActiveRecord::Schema.define(:version => 20110326121927) do

  create_table "accounts", :force => true do |t|
    t.string  "name",                                      :null => false
    t.text    "description",                               :null => false
    t.decimal "balance",     :precision => 8, :scale => 2, :null => false
    t.integer "user_id",                                   :null => false
    t.integer "owner_id",                                  :null => false
    t.string  "owner_type",                                :null => false
  end

  add_index "accounts", ["owner_id", "owner_type"], :name => "uk_account_owner", :unique => true

  create_table "accounts_bank_accounts", :force => true do |t|
    t.string   "sort_code",      :default => "", :null => false
    t.string   "account_number", :default => "", :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id",                                                :null => false
    t.integer  "user_id",                                                   :null => false
    t.decimal  "amount",      :precision => 8, :scale => 2,                 :null => false
    t.integer  "owner_id",                                                  :null => false
    t.string   "owner_type",                                                :null => false
    t.text     "description",                               :default => "", :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "transactions", ["owner_id", "owner_type"], :name => "uk_transaction_owner", :unique => true

  create_table "transactions_manuals", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "email",         :null => false
    t.string   "password_hash", :null => false
    t.string   "password_salt", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
