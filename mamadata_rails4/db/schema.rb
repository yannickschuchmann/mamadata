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

ActiveRecord::Schema.define(version: 20140221212939) do

  create_table "beneficiary_program_relationships", force: true do |t|
    t.integer  "program_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",  default: false
    t.datetime "deleted_at"
  end

  add_index "beneficiary_program_relationships", ["person_id"], name: "index_beneficiary_program_relationships_on_person_id"
  add_index "beneficiary_program_relationships", ["program_id"], name: "index_beneficiary_program_relationships_on_program_id"

  create_table "benefit_incidents", force: true do |t|
    t.integer  "person_id"
    t.integer  "benefit_id"
    t.integer  "program_id"
    t.integer  "amount_paise",              limit: 8, default: 0
    t.string   "amount_currency",                     default: "INR", null: false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_granted"
    t.boolean  "status"
    t.integer  "amount_in_euro_paise",      limit: 8, default: 0
    t.string   "amount_in_euro_currency",             default: "EUR", null: false
    t.integer  "amount_in_dollar_paise",    limit: 8, default: 0
    t.string   "amount_in_dollar_currency",           default: "USD", null: false
  end

  add_index "benefit_incidents", ["benefit_id"], name: "index_benefit_incidents_on_benefit_id"
  add_index "benefit_incidents", ["person_id"], name: "index_benefit_incidents_on_person_id"
  add_index "benefit_incidents", ["program_id"], name: "index_benefit_incidents_on_program_id"

  create_table "benefits", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "optional_amount_paise",    limit: 8
    t.string   "optional_amount_currency",           default: "INR", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fixed_amount_paise",       limit: 8
    t.string   "fixed_amount_currency",              default: "INR", null: false
    t.integer  "max_people"
    t.string   "category"
  end

  create_table "community_developments", force: true do |t|
    t.string   "type_of_family"
    t.string   "residental_status"
    t.string   "house_possession"
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

  create_table "donor_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", force: true do |t|
    t.integer  "person_id"
    t.integer  "community_development_id"
    t.string   "name"
    t.integer  "head_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "families", ["community_development_id"], name: "index_families_on_community_development_id"
  add_index "families", ["head_id"], name: "index_families_on_head_id"
  add_index "families", ["person_id"], name: "index_families_on_person_id"

  create_table "godfather_people", force: true do |t|
    t.integer  "person_id"
    t.integer  "godfather_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "journals", force: true do |t|
    t.integer  "person_id"
    t.text     "text"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journals", ["person_id"], name: "index_journals_on_person_id"

  create_table "people", force: true do |t|
    t.string   "name",                          default: ""
    t.string   "fathers_name",                  default: ""
    t.string   "gender",                        default: ""
    t.date     "date_of_birth"
    t.string   "place_of_birth",                default: ""
    t.string   "native_place",                  default: ""
    t.string   "name_of_the_house",             default: ""
    t.integer  "number_of_the_house"
    t.string   "name_of_the_street",            default: ""
    t.string   "city",                          default: ""
    t.string   "zip_code"
    t.string   "religion",                      default: ""
    t.string   "caste",                         default: ""
    t.string   "education",                     default: ""
    t.string   "marital_status",                default: ""
    t.string   "health_condition",              default: ""
    t.string   "occupation",                    default: ""
    t.integer  "income_paise",        limit: 8, default: 0
    t.string   "income_currency",               default: "INR", null: false
    t.integer  "family_id"
    t.integer  "role_id"
    t.text     "narrative_text"
    t.text     "default"
    t.string   "status",                        default: ""
    t.integer  "godfather_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "area"
    t.string   "file_number",                   default: ""
    t.string   "head_of_household"
  end

  add_index "people", ["family_id"], name: "index_people_on_family_id"
  add_index "people", ["godfather_id"], name: "index_people_on_godfather_id"
  add_index "people", ["role_id"], name: "index_people_on_role_id"

  create_table "person_godfather_files", force: true do |t|
    t.integer  "godfather_person_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark",              default: "", null: false
  end

  create_table "possible_choices", force: true do |t|
    t.string   "property"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_benefit_relationships", force: true do |t|
    t.integer  "program_id"
    t.integer  "benefit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_benefit_relationships", ["benefit_id"], name: "index_program_benefit_relationships_on_benefit_id"
  add_index "program_benefit_relationships", ["program_id"], name: "index_program_benefit_relationships_on_program_id"

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

  create_table "school_classes", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_classes", ["school_id"], name: "index_school_classes_on_school_id"

  create_table "schools", force: true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "type"
    t.text     "remark"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "terminated_at"
    t.string   "termination_reason"
    t.text     "termination_remark"
    t.datetime "joined_at"
  end

  add_index "schools", ["person_id"], name: "index_schools_on_person_id"

  create_table "supporters", force: true do |t|
    t.string   "organisation"
    t.string   "name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "zipcode"
    t.string   "email"
    t.string   "website"
    t.string   "telephone_number"
    t.boolean  "godfather"
    t.boolean  "is_volunteer"
    t.date     "begin_of_work"
    t.date     "end_of_work"
    t.string   "type_of_work"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_donor"
    t.integer  "donation_amount_paise",    limit: 8
    t.string   "donation_amount_currency",           default: "INR", null: false
    t.integer  "donor_type_id"
    t.date     "donation_year"
    t.string   "street_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "position_in_organisation"
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
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
