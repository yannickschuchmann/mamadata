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

ActiveRecord::Schema.define(version: 20131111144936) do

  create_table "beneficiaries", force: true do |t|
    t.string   "name"
    t.string   "fathers_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "native_place"
    t.string   "house_name"
    t.integer  "house_number"
    t.string   "street_name"
    t.string   "city"
    t.integer  "pin_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supporters", force: true do |t|
    t.string   "name"
    t.string   "fathers_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "native_place"
    t.string   "name_of_the_house"
    t.string   "name_of_street"
    t.string   "city"
    t.integer  "zipcode"
    t.integer  "godfather_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
