# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_03_082624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appearances", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "recruit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_appearances_on_event_id"
    t.index ["recruit_id"], name: "index_appearances_on_recruit_id"
  end

  create_table "athlete_events", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["athlete_id"], name: "index_athlete_events_on_athlete_id"
    t.index ["event_id"], name: "index_athlete_events_on_event_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "grad_year"
    t.string "athlete_team"
    t.string "athlete_team_url"
    t.integer "rating"
    t.string "nationality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "start_time"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "appearance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appearance_id"], name: "index_notes_on_appearance_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recruits", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.index ["athlete_id"], name: "index_recruits_on_athlete_id"
    t.index ["team_id"], name: "index_recruits_on_team_id"
  end

  create_table "schedule_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["event_id"], name: "index_schedule_events_on_event_id"
    t.index ["schedule_id"], name: "index_schedule_events_on_schedule_id"
    t.index ["user_id"], name: "index_schedule_events_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_schedules_on_team_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.bigint "sport_id", null: false
    t.integer "selected_schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_teams_on_organization_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

  create_table "unavailable_days", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_unavailable_days_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "Head Coach"
    t.bigint "team_id", null: false
    t.integer "selected_schedule_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appearances", "events"
  add_foreign_key "appearances", "recruits"
  add_foreign_key "athlete_events", "athletes"
  add_foreign_key "athlete_events", "events"
  add_foreign_key "notes", "appearances"
  add_foreign_key "notes", "users"
  add_foreign_key "recruits", "athletes"
  add_foreign_key "recruits", "teams"
  add_foreign_key "schedule_events", "events"
  add_foreign_key "schedule_events", "schedules"
  add_foreign_key "schedule_events", "users"
  add_foreign_key "schedules", "teams"
  add_foreign_key "teams", "organizations"
  add_foreign_key "teams", "sports"
  add_foreign_key "unavailable_days", "users"
  add_foreign_key "users", "teams"
end
