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

ActiveRecord::Schema.define(version: 2020_03_03_001220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "January"
    t.string "February"
    t.string "March"
    t.string "April"
    t.string "May"
    t.string "June"
    t.string "July"
    t.string "August"
    t.string "September"
    t.string "October"
    t.string "November"
    t.string "December"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_id"
    t.index ["city_id"], name: "index_city_themes_on_city_id"
    t.index ["theme_id"], name: "index_city_themes_on_theme_id"
  end

  create_table "climates", force: :cascade do |t|
    t.bigint "city_id"
    t.string "January"
    t.string "February"
    t.string "March"
    t.string "April"
    t.string "May"
    t.string "June"
    t.string "July"
    t.string "August"
    t.string "September"
    t.string "October"
    t.string "November"
    t.string "December"
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
