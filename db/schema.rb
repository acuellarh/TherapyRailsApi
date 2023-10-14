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

ActiveRecord::Schema.define(version: 2023_10_14_191452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_status_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "pacient_id", null: false
    t.datetime "sale_date"
    t.decimal "total_order"
    t.boolean "total_paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_status_type_id", null: false
    t.index ["order_status_type_id"], name: "index_orders_on_order_status_type_id"
    t.index ["pacient_id"], name: "index_orders_on_pacient_id"
  end

  create_table "pacients", force: :cascade do |t|
    t.bigint "gender_id", null: false
    t.bigint "relationship_id", null: false
    t.bigint "document_type_id", null: false
    t.string "name"
    t.string "lastname"
    t.date "birthday"
    t.string "identifier"
    t.string "mobile"
    t.string "email"
    t.string "address"
    t.string "other_contact"
    t.string "other_contact_mobile"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_type_id"], name: "index_pacients_on_document_type_id"
    t.index ["gender_id"], name: "index_pacients_on_gender_id"
    t.index ["relationship_id"], name: "index_pacients_on_relationship_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "order_status_types"
  add_foreign_key "orders", "pacients"
  add_foreign_key "pacients", "document_types"
  add_foreign_key "pacients", "genders"
  add_foreign_key "pacients", "relationships"
end
