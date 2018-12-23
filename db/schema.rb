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

ActiveRecord::Schema.define(version: 2018_12_18_201727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ynab_bid"
    t.string "name"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "ynab_cid"
    t.string "name"
    t.bigint "budget_id"
    t.index ["budget_id"], name: "index_categories_on_budget_id"
  end

  create_table "days", force: :cascade do |t|
    t.bigint "notification_id"
    t.string "day"
    t.index ["notification_id"], name: "index_days_on_notification_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "category_id"
    t.time "time"
    t.boolean "email_notice"
    t.boolean "text_notice"t
    t.index ["category_id"], name: "index_notifications_on_category_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.string "refresh_token"
    t.string "uid"
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  add_foreign_key "budgets", "users"
  add_foreign_key "categories", "budgets"
  add_foreign_key "days", "notifications"
  add_foreign_key "notifications", "categories"
  add_foreign_key "tokens", "users"
end
