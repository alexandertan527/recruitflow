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

ActiveRecord::Schema[7.1].define(version: 2025_04_13_111525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "current_job_title"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "client_contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "phone_number"
    t.string "email"
    t.string "status"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_contacts_on_client_id"
    t.index ["user_id"], name: "index_client_contacts_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "sector"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "interview_type"
    t.datetime "interview_date"
    t.bigint "candidate_id", null: false
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["job_id"], name: "index_interviews_on_job_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_title"
    t.string "employment_type"
    t.string "status"
    t.boolean "is_live"
    t.integer "salary"
    t.bigint "client_contact_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_contact_id"], name: "index_jobs_on_client_contact_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_offers_on_candidate_id"
    t.index ["job_id"], name: "index_offers_on_job_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "candidate_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_submissions_on_candidate_id"
    t.index ["job_id"], name: "index_submissions_on_job_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "users"
  add_foreign_key "client_contacts", "clients"
  add_foreign_key "client_contacts", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "interviews", "jobs"
  add_foreign_key "interviews", "users"
  add_foreign_key "jobs", "client_contacts"
  add_foreign_key "jobs", "users"
  add_foreign_key "offers", "candidates"
  add_foreign_key "offers", "jobs"
  add_foreign_key "offers", "users"
  add_foreign_key "submissions", "candidates"
  add_foreign_key "submissions", "jobs"
  add_foreign_key "submissions", "users"
end
