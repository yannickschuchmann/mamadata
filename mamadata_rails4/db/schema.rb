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

ActiveRecord::Schema.define(version: 20131117193456) do

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "fathers_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "native_place"
    t.string   "name_of_the_house"
    t.integer  "number_of_the_house"
    t.string   "name_of_the_street"
    t.string   "city"
    t.integer  "pin_code"
    t.string   "religion"
    t.string   "caste"
    t.string   "education"
    t.string   "marital_status"
    t.string   "health_condition"
    t.string   "occupation"
    t.integer  "income"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["role_id"], name: "index_people_on_role_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supporters", force: true do |t|
    t.string   "organisation"
    t.string   "name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.integer  "zipcode"
    t.string   "email"
    t.string   "website"
    t.string   "telephone_number"
    t.string   "godfather"
    t.boolean  "is_volunteer"
    t.date     "begin_of_work"
    t.date     "end_of_work"
    t.string   "type_of_work"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end