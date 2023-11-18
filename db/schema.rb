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

ActiveRecord::Schema.define(version: 2023_11_18_203924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "order_detail_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "appointment_state_id", null: false
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_state_id"], name: "index_appointments_on_appointment_state_id"
    t.index ["employee_id"], name: "index_appointments_on_employee_id"
    t.index ["order_detail_id"], name: "index_appointments_on_order_detail_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employee_positions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employee_schedules", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "schedule_date"
    t.string "schedule_day"
    t.time "start_time"
    t.time "end_time"
    t.bigint "schedule_state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_schedules_on_employee_id"
    t.index ["schedule_state_id"], name: "index_employee_schedules_on_schedule_state_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "address"
    t.bigint "employee_position_id", null: false
    t.string "email"
    t.string "identifier"
    t.string "mobile"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_position_id"], name: "index_employees_on_employee_position_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.decimal "discount"
    t.decimal "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "order_status_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "pacient_id", null: false
    t.datetime "sale_date"
    t.decimal "total_order", default: "0.0"
    t.boolean "total_paid", default: false
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
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_type_id"], name: "index_pacients_on_document_type_id"
    t.index ["gender_id"], name: "index_pacients_on_gender_id"
    t.index ["relationship_id"], name: "index_pacients_on_relationship_id"
  end

  create_table "patient_histories", force: :cascade do |t|
    t.bigint "diagnosis_id"
    t.bigint "appointment_id", null: false
    t.string "treatment_given"
    t.integer "strength_scale"
    t.integer "pain_scale"
    t.integer "movement_scale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_patient_histories_on_appointment_id"
    t.index ["diagnosis_id"], name: "index_patient_histories_on_diagnosis_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "payment_method_id", null: false
    t.decimal "amount"
    t.string "payment_support_url"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_category_id", null: false
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "appointment_states"
  add_foreign_key "appointments", "employees"
  add_foreign_key "appointments", "order_details"
  add_foreign_key "employee_schedules", "employees"
  add_foreign_key "employee_schedules", "schedule_states"
  add_foreign_key "employees", "employee_positions"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "order_status_types"
  add_foreign_key "orders", "pacients"
  add_foreign_key "pacients", "document_types"
  add_foreign_key "pacients", "genders"
  add_foreign_key "pacients", "relationships"
  add_foreign_key "patient_histories", "appointments"
  add_foreign_key "patient_histories", "diagnoses"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "products", "product_categories"
end
