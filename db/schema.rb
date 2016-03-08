# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160305094120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_answers", force: true do |t|
    t.integer "question_id"
    t.integer "answer_id"
    t.boolean "is_correct",  default: false
  end

  add_index "question_answers", ["answer_id"], name: "index_question_answers_on_answer_id", using: :btree
  add_index "question_answers", ["question_id"], name: "index_question_answers_on_question_id", using: :btree

  create_table "question_sets", force: true do |t|
    t.integer  "user_set_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_sets", ["answer_id"], name: "index_question_sets_on_answer_id", using: :btree
  add_index "question_sets", ["question_id"], name: "index_question_sets_on_question_id", using: :btree
  add_index "question_sets", ["user_set_id"], name: "index_question_sets_on_user_set_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["technology_id"], name: "index_questions_on_technology_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies", force: true do |t|
    t.string   "name"
    t.string   "reviewer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sets", force: true do |t|
    t.integer  "user_id"
    t.integer  "technology_id"
    t.integer  "invitee_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "score"
    t.integer  "status",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sets", ["technology_id"], name: "index_user_sets_on_technology_id", using: :btree
  add_index "user_sets", ["user_id"], name: "index_user_sets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "set_last_seen_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
    t.integer  "role_id"
    t.integer  "status",                 default: 0
    t.integer  "invited_by"
    t.string   "phone_no"
    t.datetime "last_seen_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
