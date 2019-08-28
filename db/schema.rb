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

ActiveRecord::Schema.define(version: 20190828020255) do

  create_table "all_seeing_eyes", force: :cascade do |t|
    t.string   "ip"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caretakers", force: :cascade do |t|
    t.string   "name"
    t.string   "doll"
    t.string   "desc"
    t.integer  "good_boi_points"
    t.integer  "bad_boi_points"
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "grubs_donated"
    t.integer  "grubs_adopted"
    t.index ["login"], name: "index_caretakers_on_login", unique: true
  end

  create_table "give_me_admin_pussies", force: :cascade do |t|
    t.string   "demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paldemic_files", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.string   "file"
    t.integer  "num_downloads"
    t.integer  "num_upvotes"
    t.integer  "num_downvotes"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "pw"
    t.integer  "num_views",     default: 0,                                           null: false
    t.string   "description",   default: "A really cool paldemic file, I promise!!!", null: false
  end

  create_table "time_holes", force: :cascade do |t|
    t.string   "wigglerJSON"
    t.boolean  "permanent"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "caretaker_id"
  end

  create_table "tombstone_timeholds", force: :cascade do |t|
    t.string   "tombstoneJSON"
    t.boolean  "permanent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "rating"
  end

end
