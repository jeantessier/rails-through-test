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

ActiveRecord::Schema.define(version: 2021_12_20_034106) do

  create_table "ceos", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ceo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ceo_id"], name: "index_directors_on_ceo_id"
  end

  create_table "managers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "director_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["director_id"], name: "index_managers_on_director_id"
  end

  create_table "workers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "manager_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "rate"
    t.float "hours"
    t.index ["manager_id"], name: "index_workers_on_manager_id"
  end

  add_foreign_key "directors", "ceos"
  add_foreign_key "managers", "directors"
  add_foreign_key "workers", "managers"
end
