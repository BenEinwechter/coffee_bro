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

ActiveRecord::Schema.define(version: 2021_07_20_004511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "favorite_drink_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drink_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "drink_id", null: false
    t.integer "grams"
    t.index ["drink_id"], name: "index_drink_ingredients_on_drink_id"
    t.index ["ingredient_id"], name: "index_drink_ingredients_on_ingredient_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "drink_id", null: false
    t.decimal "price", null: false
    t.decimal "tax", null: false
    t.decimal "total", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["drink_id"], name: "index_sales_on_drink_id"
  end

  add_foreign_key "customers", "drinks", column: "favorite_drink_id", on_delete: :nullify
  add_foreign_key "drink_ingredients", "drinks"
  add_foreign_key "drink_ingredients", "ingredients"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "drinks"
end
