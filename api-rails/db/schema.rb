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

ActiveRecord::Schema[8.0].define(version: 2025_04_01_041304) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "name", limit: 200
    t.integer "company_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_backgrounds_on_company_id"
  end

  create_table "board_users", force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_users_on_board_id"
    t.index ["user_id"], name: "index_board_users_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "background_id"
    t.integer "company_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["background_id"], name: "index_boards_on_background_id"
    t.index ["company_id"], name: "index_boards_on_company_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "hex", limit: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description", limit: 2000
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "label_tasks", force: :cascade do |t|
    t.integer "label_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_label_tasks_on_label_id"
    t.index ["task_id"], name: "index_label_tasks_on_task_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "color_id", null: false
    t.integer "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_labels_on_board_id"
    t.index ["color_id"], name: "index_labels_on_color_id"
  end

  create_table "list_roles", force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "role_id", null: false
    t.boolean "can_move_in", default: true, null: false
    t.boolean "can_move_out", default: true, null: false
    t.boolean "can_create", default: true, null: false
    t.boolean "can_edit", default: true, null: false
    t.boolean "can_delete", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_roles_on_list_id"
    t.index ["role_id"], name: "index_list_roles_on_role_id"
  end

  create_table "list_users", force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "user_id", null: false
    t.boolean "can_move_in", default: true, null: false
    t.boolean "can_move_out", default: true, null: false
    t.boolean "can_create", default: true, null: false
    t.boolean "can_edit", default: true, null: false
    t.boolean "can_delete", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_users_on_list_id"
    t.index ["user_id"], name: "index_list_users_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "index", null: false
    t.integer "color_id", null: false
    t.integer "board_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
    t.index ["color_id"], name: "index_lists_on_color_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "board_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_roles_on_board_id"
  end

  create_table "task_users", force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_users_on_task_id"
    t.index ["user_id"], name: "index_task_users_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", limit: 300, null: false
    t.string "description", limit: 1000, null: false
    t.string "content", limit: 30000, null: false
    t.datetime "estimate_date"
    t.datetime "limit_date"
    t.integer "list_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "last_name", limit: 100
    t.string "nickname", limit: 100
    t.string "email", limit: 100, null: false
    t.string "password_digest", limit: 72, null: false
    t.boolean "admin", default: false, null: false
    t.integer "company_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "backgrounds", "companies"
  add_foreign_key "board_users", "boards"
  add_foreign_key "board_users", "users"
  add_foreign_key "boards", "backgrounds"
  add_foreign_key "boards", "companies"
  add_foreign_key "label_tasks", "labels"
  add_foreign_key "label_tasks", "tasks"
  add_foreign_key "labels", "boards"
  add_foreign_key "labels", "colors"
  add_foreign_key "list_roles", "lists"
  add_foreign_key "list_roles", "roles"
  add_foreign_key "list_users", "lists"
  add_foreign_key "list_users", "users"
  add_foreign_key "lists", "boards"
  add_foreign_key "lists", "colors"
  add_foreign_key "roles", "boards"
  add_foreign_key "task_users", "tasks"
  add_foreign_key "task_users", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "companies"
end
