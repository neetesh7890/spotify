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

ActiveRecord::Schema.define(version: 20171013090027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_tracks", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_tracks_on_album_id"
    t.index ["track_id"], name: "index_album_tracks_on_track_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
    t.string "spotify_url"
    t.string "release_date"
    t.string "image_url"
    t.string "large_image_url"
    t.string "upc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "artist_genres", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_genres_on_artist_id"
    t.index ["genre_id"], name: "index_artist_genres_on_genre_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "spotify_name"
    t.integer "popularity"
    t.integer "followers"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "related_tracks", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_related_tracks_on_artist_id"
    t.index ["trackable_type", "trackable_id"], name: "index_related_tracks_on_trackable_type_and_trackable_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "spotify_name"
    t.string "isrc_code"
    t.integer "popularity"
    t.string "platform_id"
    t.string "spotify_id"
    t.string "spotify_url"
    t.string "preview_url"
    t.string "available_market"
    t.string "artist_name"
    t.integer "duration"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_albums", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_user_albums_on_album_id"
    t.index ["user_id"], name: "index_user_albums_on_user_id"
  end

  create_table "user_tracks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_user_tracks_on_track_id"
    t.index ["user_id"], name: "index_user_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "token"
    t.integer "expires_at"
    t.string "country"
    t.string "spotify_url"
    t.string "spotify_id"
    t.string "image_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "users"
  add_foreign_key "related_tracks", "artists"
end
