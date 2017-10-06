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

ActiveRecord::Schema.define(version: 20171005130658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "singer_name"
    t.string "get_album"
    t.string "image"
    t.string "album_item_type"
    t.bigint "album_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_item_type", "album_item_id"], name: "index_albums_on_album_item_type_and_album_item_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.integer "popularity"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "singer_name"
    t.string "image"
    t.string "song_item_type"
    t.bigint "song_item_id"
    t.string "get_song"
    t.string "playlist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_item_type", "song_item_id"], name: "index_songs_on_song_item_type_and_song_item_id"
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
    t.text "token"
    t.text "refresh_token"
    t.integer "expires_at"
    t.string "name"
    t.string "nickname"
    t.string "url"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artists", "users"
end
