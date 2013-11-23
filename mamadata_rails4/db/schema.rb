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

ActiveRecord::Schema.define(version: 20131122221509) do

  create_table "beneficiaries", force: true do |t|
    t.integer  "program_id"
    t.string   "school_name"
    t.string   "school_type"
    t.string   "school_language"
    t.string   "school_class"
    t.text     "narrative_text"
    t.integer  "godfather_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beneficiaries", ["godfather_id"], name: "index_beneficiaries_on_godfather_id"
  add_index "beneficiaries", ["program_id"], name: "index_beneficiaries_on_program_id"

  create_table "benefit_incidents", force: true do |t|
    t.integer  "person_id"
    t.integer  "program_benefit_relationship_id"
    t.integer  "amount"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefits", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "community_developments", force: true do |t|
    t.integer  "head_of_household_id"
    t.string   "type_of_family"
    t.string   "residental_status"
    t.string   "house_posession"
    t.string   "house_type"
    t.boolean  "electricity"
    t.string   "water_from"
    t.boolean  "toilet_facility"
    t.boolean  "rain_harvesting"
    t.boolean  "want_rain_harvesting"
    t.integer  "earning_members_of_family"
    t.string   "source_of_income"
    t.string   "land_details"
    t.boolean  "any_savings"
    t.string   "mode_of_savings"
    t.boolean  "debts"
    t.string   "reason_for_debt"
    t.string   "family_members_addicted_to"
    t.string   "family_members_addicted_who"
    t.boolean  "family_disabled"
    t.string   "family_type_of_handicap"
    t.boolean  "family_chronic_deseases"
    t.string   "family_chronic_deseases_which"
    t.boolean  "family_children_vaccined"
    t.boolean  "family_knowledge_of_family_planning"
    t.boolean  "family_undergone_family_planning"
    t.boolean  "home_remedies_for_illnesses"
    t.string   "illness_treatment"
    t.boolean  "family_school_dropout"
    t.text     "family_dropout_reason_for"
    t.text     "family_dropout_present_condition"
    t.string   "family_skilled_in_art"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "program_benefit_relationships", force: true do |t|
    t.integer  "program_id"
    t.integer  "benefit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
