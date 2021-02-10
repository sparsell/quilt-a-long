

ActiveRecord::Schema.define(version: 2021_02_09_170137) do

  create_table "qals", force: :cascade do |t|
    t.string "qal_name"
    t.integer "start_date"
    t.integer "end_date"
    t.integer "user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "company_name"
    t.string "quilting_style"
  end

end
