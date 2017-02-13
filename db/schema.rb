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

ActiveRecord::Schema.define(version: 20170212210139) do

  create_table "actors", force: :cascade do |t|
    t.string   "avatar"
    t.string   "name",                 null: false
    t.text     "about"
    t.integer  "movies_actors_count"
    t.integer  "awards_awardee_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "awards", force: :cascade do |t|
    t.string   "tile",                 null: false
    t.text     "desc"
    t.integer  "awards_awardee_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "awards_awardees", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "awardee_id"
    t.string   "awardee_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "awards_awardees", ["movie_id"], name: "index_awards_awardees_on_movie_id"

  create_table "directors", force: :cascade do |t|
    t.string   "avatar"
    t.string   "name",                 null: false
    t.text     "about"
    t.integer  "awards_awardee_count"
    t.integer  "movies_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",                null: false
    t.integer  "movies_genres_count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "poster"
    t.integer  "director_id"
    t.text     "about"
    t.boolean  "featured",              default: false
    t.string   "name",                                  null: false
    t.date     "release_date",                          null: false
    t.string   "rating",                                null: false
    t.string   "trailer_url"
    t.integer  "movies_actors_count"
    t.integer  "movies_genres_count"
    t.integer  "news_count"
    t.integer  "reviews_count"
    t.integer  "watchlist_items_count"
    t.integer  "awards_awardee_count"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "movies_actors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "desc",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rate",       null: false
    t.text     "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.string   "avatar"
    t.text     "about"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "reviews_count"
    t.integer  "watchlist_items_count"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "watchlist_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
