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

ActiveRecord::Schema.define(version: 20131112230242) do

  create_table "ben_family_members", force: true do |t|
    t.integer  "beneficiary_id"
    t.string   "relation"
    t.string   "status"
    t.string   "name"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "profession"
    t.integer  "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "surname"
    t.text     "narrative_text"
    t.string   "school_name"
    t.string   "school_type"
    t.string   "school_class"
    t.string   "health_condition"
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
