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

ActiveRecord::Schema.define(version: 20170222231141) do

  create_table "musics", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.integer  "play"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_musics_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "plays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_playlists_on_song_id"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "songlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "play"
    t.index ["music_id"], name: "index_songlists_on_music_id"
    t.index ["user_id"], name: "index_songlists_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "play"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
