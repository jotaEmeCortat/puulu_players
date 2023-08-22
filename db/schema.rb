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

ActiveRecord::Schema[7.0].define(version: 2023_08_22_101038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "players_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "player_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["players_id"], name: "index_bookings_on_players_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.string "player_email"
    t.string "player_nationality"
    t.string "player_gender"
    t.string "player_description"
    t.date "player_date_of_birth"
    t.string "player_position"
    t.string "player_role"
    t.string "player_handedness"
    t.string "player_social"
    t.string "player_avatar_image"
    t.string "player_banner_image"
    t.boolean "player_availability"
    t.date "player_availability_period"
    t.integer "player_rating"
    t.integer "player_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "height"
    t.integer "weight"
    t.integer "appearances"
    t.integer "goal_accuracy"
    t.integer "goal_5m"
    t.integer "goal_h_plus"
    t.integer "goal_save"
    t.integer "exclusion_conceded"
    t.integer "exclusion_success"
    t.integer "ratio"
    t.bigint "players_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["players_id"], name: "index_stats_on_players_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_name"
    t.string "team_country"
    t.text "team_description"
    t.string "team_badge_image"
    t.string "team_banner_image"
    t.integer "team_rating"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "players", column: "players_id"
  add_foreign_key "bookings", "users", column: "users_id"
  add_foreign_key "stats", "players", column: "players_id"
end
