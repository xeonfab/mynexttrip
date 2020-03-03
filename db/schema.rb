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

ActiveRecord::Schema.define(version: 2020_03_03_054751) do

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

  create_table "booking_providers", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "description"
    t.string "category"
    t.bigint "country_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_booking_providers_on_city_id"
    t.index ["country_id"], name: "index_booking_providers_on_country_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "city_features", force: :cascade do |t|
    t.bigint "city_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "feature_id"
    t.index ["city_id"], name: "index_city_features_on_city_id"
    t.index ["feature_id"], name: "index_city_features_on_feature_id"
  end

  create_table "city_themes", force: :cascade do |t|
    t.bigint "city_id"
    t.integer "january", default: 0
    t.integer "february", default: 0
    t.integer "march", default: 0
    t.integer "april", default: 0
    t.integer "may", default: 0
    t.integer "june", default: 0
    t.integer "july", default: 0
    t.integer "august", default: 0
    t.integer "september", default: 0
    t.integer "october", default: 0
    t.integer "november", default: 0
    t.integer "december", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["city_id"], name: "index_city_themes_on_city_id"
    t.index ["theme_id"], name: "index_city_themes_on_theme_id"
  end

  create_table "climates", force: :cascade do |t|
    t.bigint "city_id"
    t.integer "january", default: 0
    t.integer "february", default: 0
    t.integer "march", default: 0
    t.integer "april", default: 0
    t.integer "may", default: 0
    t.integer "june", default: 0
    t.integer "july", default: 0
    t.integer "august", default: 0
    t.integer "september", default: 0
    t.integer "october", default: 0
    t.integer "november", default: 0
    t.integer "december", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_climates_on_city_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_countries_on_region_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "booking_providers", "cities"
  add_foreign_key "booking_providers", "countries"
  add_foreign_key "cities", "countries"
  add_foreign_key "city_features", "cities"
  add_foreign_key "city_features", "features"
  add_foreign_key "city_themes", "cities"
  add_foreign_key "city_themes", "themes"
  add_foreign_key "climates", "cities"
  add_foreign_key "countries", "regions"
end
