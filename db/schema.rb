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

ActiveRecord::Schema.define(version: 2019_02_19_093713) do

  create_table "course_subjects", force: :cascade do |t|
    t.integer "course_id"
    t.integer "subject_id"
    t.integer "status", default: 0, null: false
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_subjects_on_course_id"
    t.index ["subject_id"], name: "index_course_subjects_on_subject_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "suppervisor_id"
    t.boolean "status", default: false
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "course_id"
    t.integer "time_day"
    t.boolean "status", default: true
    t.integer "suppervisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subjects_on_course_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_tasks_on_subject_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "user_subjects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_subject_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_subject_id"], name: "index_user_subjects_on_course_subject_id"
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_subject_id"
    t.integer "status", default: 0
    t.datetime "receive_at"
    t.datetime "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_subject_id"], name: "index_user_tasks_on_user_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birthday"
    t.string "password"
    t.string "password_digest"
    t.integer "group", default: 0, null: false
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
