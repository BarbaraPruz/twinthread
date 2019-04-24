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

ActiveRecord::Schema.define(version: 2019_04_24_210640) do

  create_table "asset_statuses", force: :cascade do |t|
    t.string "description"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parental_relations", force: :cascade do |t|
    t.integer "t_asset_id"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "property_id"
    t.string "value"
    t.string "units"
    t.integer "datatype"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_assets", force: :cascade do |t|
    t.integer "asset_id"
    t.string "name"
    t.string "description"
    t.integer "status"
    t.string "icon"
    t.integer "parent_asset_id"
  end

  create_table "t_assets_classes", id: false, force: :cascade do |t|
    t.integer "t_asset_id", null: false
    t.integer "t_class_id", null: false
    t.index ["t_asset_id", "t_class_id"], name: "index_t_assets_classes_on_t_asset_id_and_t_class_id"
    t.index ["t_class_id", "t_asset_id"], name: "index_t_assets_classes_on_t_class_id_and_t_asset_id"
  end

  create_table "t_classes", force: :cascade do |t|
    t.integer "class_id"
    t.string "name"
    t.string "drill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
