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

ActiveRecord::Schema.define(version: 20141204135351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abouts", ["site_id"], name: "index_abouts_on_site_id", using: :btree

  create_table "consents", force: true do |t|
    t.text     "header"
    t.text     "body"
    t.text     "footer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "consents", ["site_id"], name: "index_consents_on_site_id", using: :btree

  create_table "contact_us_pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "contact_us_pages", ["site_id"], name: "index_contact_us_pages_on_site_id", using: :btree

  create_table "eligibilities", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "eligibilities", ["site_id"], name: "index_eligibilities_on_site_id", using: :btree

  create_table "fundings", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "fundings", ["site_id"], name: "index_fundings_on_site_id", using: :btree

  create_table "homes", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homes", ["site_id"], name: "index_homes_on_site_id", using: :btree

  create_table "irb_acceptance_images", force: true do |t|
    t.integer  "consent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "irb_acceptance_images", ["consent_id"], name: "index_irb_acceptance_images_on_consent_id", using: :btree

  create_table "point_of_contacts", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "point_of_contacts", ["site_id"], name: "index_point_of_contacts_on_site_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["site_id"], name: "index_projects_on_site_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "resources", ["site_id"], name: "index_resources_on_site_id", using: :btree

  create_table "screening_answers", force: true do |t|
    t.integer "screening_question_id"
    t.string  "answer_value"
    t.integer "position"
    t.boolean "active"
  end

  add_index "screening_answers", ["screening_question_id"], name: "index_screening_answers_on_screening_question_id", using: :btree

  create_table "screening_questions", force: true do |t|
    t.integer "site_id"
    t.string  "question_type"
    t.string  "question_value"
    t.integer "position"
    t.boolean "active"
  end

  add_index "screening_questions", ["site_id"], name: "index_screening_questions_on_site_id", using: :btree

  create_table "site_consent_form_versions", force: true do |t|
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_consent_form_versions", ["site_id"], name: "index_site_consent_form_versions_on_site_id", using: :btree

  create_table "site_images", force: true do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "site_images", ["site_id", "position"], name: "index_site_images_on_site_id_and_position", unique: true, using: :btree
  add_index "site_images", ["site_id"], name: "index_site_images_on_site_id", using: :btree
  add_index "site_images", ["user_id"], name: "index_site_images_on_user_id", using: :btree

  create_table "site_phis", force: true do |t|
    t.integer "site_id"
    t.string  "type"
    t.integer "position"
    t.boolean "active"
    t.boolean "required"
  end

  add_index "site_phis", ["site_id"], name: "index_site_phis_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template_name"
  end

  create_table "sites_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "site_id", null: false
  end

  create_table "user_admin_audits", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_admin_audits", ["site_id"], name: "index_user_admin_audits_on_site_id", using: :btree
  add_index "user_admin_audits", ["user_id"], name: "index_user_admin_audits_on_user_id", using: :btree

  create_table "user_consents", force: true do |t|
    t.integer  "site_id"
    t.string   "irb_acceptance_image_url"
    t.text     "consent_header"
    t.text     "consent_body"
    t.text     "consent_footer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "site_consent_form_version_id"
  end

  add_index "user_consents", ["site_consent_form_version_id"], name: "index_user_consents_on_site_consent_form_version_id", using: :btree
  add_index "user_consents", ["site_id"], name: "index_user_consents_on_site_id", using: :btree
  add_index "user_consents", ["user_id"], name: "index_user_consents_on_user_id", using: :btree

  create_table "user_screening_flags", force: true do |t|
    t.integer "user_id"
    t.integer "site_id"
    t.boolean "active"
  end

  add_index "user_screening_flags", ["site_id"], name: "index_user_screening_flags_on_site_id", using: :btree
  add_index "user_screening_flags", ["user_id"], name: "index_user_screening_flags_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "future_contact",         default: true
    t.string   "phone"
    t.integer  "role_identifier",        default: 4
    t.string   "external_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
