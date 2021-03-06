# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_24_111618) do

  create_table "prizes", force: :cascade do |t|
    t.string "prize_name"
    t.integer "qal_id"
    t.integer "sponsor_id"
  end

  create_table "qals", force: :cascade do |t|
    t.string "qal_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "user_id"
    t.string "quilting_style"
    t.string "skill_level"
  end

  create_table "quilters", force: :cascade do |t|
    t.string "quilter_name"
    t.integer "qal_id"
  end

  create_table "quilts", force: :cascade do |t|
    t.string "quilt_name"
    t.boolean "is_finished"
    t.integer "quilter_id"
    t.integer "qal_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "sponsor_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "company_name"
    t.string "quilting_style"
  end

end
