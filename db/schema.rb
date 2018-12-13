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

ActiveRecord::Schema.define(version: 2018_12_10_175340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "command_items", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_command_items_on_project_id"
    t.index ["user_id"], name: "index_command_items_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log"
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "deadline"
    t.boolean "completed"
    t.datetime "started"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", comment: "Задачи", force: :cascade do |t|
    t.string "title", comment: "Заголовок"
    t.text "body", comment: "Описание"
    t.datetime "deadline", comment: "Планируемое окончание"
    t.boolean "completed", comment: "Выполнено"
    t.datetime "started", comment: "Начато"
    t.integer "project_id", comment: "ID проекта"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "doer_id"
    t.integer "npos"
    t.index ["doer_id"], name: "index_tasks_on_doer_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "email"
    t.string "auth_token"
    t.boolean "deleted"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "command_items", "projects"
  add_foreign_key "command_items", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "users"
end
