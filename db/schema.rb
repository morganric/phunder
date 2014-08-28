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

ActiveRecord::Schema.define(version: 20140828142531) do

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "target"
    t.boolean  "live"
    t.integer  "price"
    t.string   "image"
    t.string   "banner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "end_date"
    t.string   "hashtag"
    t.string   "water_mark"
    t.string   "slug"
  end

  add_index "campaigns", ["slug"], name: "index_campaigns_on_slug", unique: true

  create_table "donations", force: true do |t|
    t.integer  "amount"
    t.string   "stripe_email"
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "photos", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.integer  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",      default: false
    t.integer  "clicks",      default: 0
    t.integer  "views",       default: 0
    t.string   "url"
  end

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.integer  "role"
    t.string   "provider"
    t.string   "uid"
    t.string   "stripe_secret_key"
    t.string   "stripe_publishable_key"
    t.string   "fb_uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["stripe_publishable_key", "stripe_secret_key"], name: "index_users_on_stripe_publishable_key_and_stripe_secret_key", unique: true

end
