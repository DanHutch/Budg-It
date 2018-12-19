ActiveRecord::Schema.define(version: 2018_12_18_201727) do

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
    t.boolean "email_notice", default: true
    t.boolean "text_notice", default: false
    t.index ["category_id"], name: "index_notifications_on_category_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.string "ynab_uid"
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
