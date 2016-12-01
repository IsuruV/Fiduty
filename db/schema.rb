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

ActiveRecord::Schema.define(version: 20161201000956) do

  create_table "advisors", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "type_of_fund"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "fund_type"
    t.float    "open"
    t.float    "day_high"
    t.float    "day_low"
    t.string   "volume"
    t.string   "week_52"
    t.string   "ytd"
    t.string   "avg_1"
    t.string   "avg_3"
    t.string   "avg_5"
    t.string   "market_cap"
    t.string   "p_e"
    t.float    "beta"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "advisor_id"
    t.string   "investment_type"
    t.float    "down_side_risk"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_portfolios", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "portfolio_id"
    t.float    "inital_investment"
    t.integer  "shares"
    t.float    "gain_loss"
    t.float    "account_value"
    t.string   "investment_date"
    t.string   "datetime"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "risk_level"
    t.string   "phone"
    t.string   "action"
    t.string   "martial_status"
    t.string   "dependants"
    t.string   "citizenship"
    t.string   "occupation"
    t.string   "dob"
    t.string   "ssn"
    t.string   "address"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
