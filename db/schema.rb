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

ActiveRecord::Schema.define(version: 20170720065649) do

  create_table "massanges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "info",       limit: 65535
    t.integer  "status"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["from_id"], name: "index_massanges_on_from_id", using: :btree
    t.index ["to_id"], name: "index_massanges_on_to_id", using: :btree
  end

  create_table "project_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "owner_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "info",       limit: 65535
    t.string   "icon"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "timesheets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_timesheets_on_project_id", using: :btree
    t.index ["user_id"], name: "index_timesheets_on_user_id", using: :btree
  end

  create_table "user_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "time_scr"
    t.integer  "manager_id"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_user_managers_on_manager_id", using: :btree
    t.index ["staff_id"], name: "index_user_managers_on_staff_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "birthday"
    t.boolean  "gender"
    t.string   "address"
    t.string   "avatar"
    t.integer  "status"
    t.boolean  "is_manager",             default: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "project_managers", "projects"
  add_foreign_key "project_managers", "users"
  add_foreign_key "screenshots", "timesheets"
  add_foreign_key "task_managers", "tasks"
  add_foreign_key "task_managers", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "timesheets", "projects"
  add_foreign_key "timesheets", "users"
end
