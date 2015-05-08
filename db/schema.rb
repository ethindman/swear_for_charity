ActiveRecord::Schema.define(version: 20150508183258) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "missions", force: :cascade do |t|
    t.string   "bad_habit"
    t.date     "target_deadline"
    t.float    "contribution_goal"
    t.string   "charity"
    t.float    "current_balance"
    t.float    "total_balance"
    t.integer  "payments_made"
    t.boolean  "goal_reached"
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "missions", ["user_id"], name: "index_missions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gravatar"
    t.text     "description"
    t.string   "encrypted_password"
    t.string   "hash_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
