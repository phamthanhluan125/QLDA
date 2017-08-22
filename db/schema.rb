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

ActiveRecord::Schema.define(version: 20170801133309) do

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "birthday"
    t.boolean  "gender",                 default: false
    t.string   "address"
    t.string   "avatar"
    t.integer  "status",                 default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_managers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "info",           limit: 65535
    t.integer  "status",                       default: 0
    t.string   "fromtable_type"
    t.integer  "fromtable_id"
    t.string   "to"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["fromtable_type", "fromtable_id"], name: "index_messages_on_fromtable_type_and_fromtable_id", using: :btree
  end

  create_table "project_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_project_managers_on_deleted_at", using: :btree
    t.index ["project_id"], name: "index_project_managers_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_managers_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "info",        limit: 65535
    t.date     "start_date"
    t.date     "deadline"
    t.date     "finish_date"
    t.integer  "status"
    t.integer  "manager_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at", using: :btree
    t.index ["manager_id"], name: "index_projects_on_manager_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "info",       limit: 65535
    t.string   "icon"
    t.integer  "manager_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["manager_id"], name: "index_roles_on_manager_id", using: :btree
  end

  create_table "screenshots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "status"
    t.integer  "timesheet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["timesheet_id"], name: "index_screenshots_on_timesheet_id", using: :btree
  end

  create_table "task_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "note",        limit: 65535
    t.date     "start_date"
    t.date     "deadline"
    t.date     "finish_date"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_task_managers_on_deleted_at", using: :btree
    t.index ["task_id"], name: "index_task_managers_on_task_id", using: :btree
    t.index ["user_id"], name: "index_task_managers_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "info"
    t.date     "start_date"
    t.date     "deadline"
    t.date     "finish_date"
    t.integer  "status"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_tasks_on_deleted_at", using: :btree
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "timesheets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_timesheets_on_project_id", using: :btree
    t.index ["user_id"], name: "index_timesheets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "birthday"
    t.boolean  "gender",                            default: false
    t.string   "address"
    t.string   "avatar"
    t.integer  "time_scr"
    t.integer  "status",                            default: 0
    t.integer  "role_id"
    t.integer  "manager_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["manager_id"], name: "index_users_on_manager_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "project_managers", "projects"
  add_foreign_key "project_managers", "users"
  add_foreign_key "projects", "managers"
  add_foreign_key "roles", "managers"
  add_foreign_key "screenshots", "timesheets"
  add_foreign_key "task_managers", "tasks"
  add_foreign_key "task_managers", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "timesheets", "projects"
  add_foreign_key "timesheets", "users"
  add_foreign_key "users", "managers"
  add_foreign_key "users", "roles"
end
