# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_27_210033) do
  create_table "items_shopping_lists", force: :cascade do |t|
    t.string "amount"
    t.string "unit"
    t.string "name"
    t.bigint "shopping_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked", default: false, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_recipes_on_url", unique: true
  end

  create_table "recipes_shopping_lists", force: :cascade do |t|
    t.bigint "shopping_list_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "shopping_list_id"], name: "index_recipes_shopping_lists_on_recipe_id_and_shopping_list_id", unique: true
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
