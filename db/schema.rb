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

ActiveRecord::Schema.define(version: 2019_10_06_001936) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.integer "is_special_collection"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "university_id"
    t.integer "library_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["library_id"], name: "index_books_on_library_id"
    t.index ["university_id"], name: "index_books_on_university_id"
  end

  create_table "borrow_histories", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_borrow_histories_on_book_id"
    t.index ["student_id"], name: "index_borrow_histories_on_student_id"
  end

  create_table "hold_lists", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_hold_lists_on_book_id"
    t.index ["student_id"], name: "index_hold_lists_on_student_id"
  end

  create_table "librarians", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "is_approved"
    t.string "name"
    t.integer "library_id"
    t.index ["email"], name: "index_librarians_on_email", unique: true
    t.index ["library_id"], name: "index_librarians_on_library_id"
    t.index ["reset_password_token"], name: "index_librarians_on_reset_password_token", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "max_day_can_borrow"
    t.integer "overdue_fine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "university_id"
    t.index ["university_id"], name: "index_libraries_on_university_id"
  end

  create_table "library_book_lists", force: :cascade do |t|
    t.integer "number"
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_library_book_lists_on_book_id"
  end

  create_table "student_current_borrow_lists", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_student_current_borrow_lists_on_book_id"
    t.index ["student_id"], name: "index_student_current_borrow_lists_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "education_level"
    t.integer "university_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "library_book_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["library_book_list_id"], name: "index_wish_lists_on_library_book_list_id"
    t.index ["student_id"], name: "index_wish_lists_on_student_id"
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "books", "universities"
  add_foreign_key "borrow_histories", "books"
  add_foreign_key "borrow_histories", "students"
  add_foreign_key "hold_lists", "books"
  add_foreign_key "hold_lists", "students"
  add_foreign_key "librarians", "libraries"
  add_foreign_key "libraries", "universities"
  add_foreign_key "library_book_lists", "books"
  add_foreign_key "student_current_borrow_lists", "books"
  add_foreign_key "student_current_borrow_lists", "students"
  add_foreign_key "students", "universities"
  add_foreign_key "wish_lists", "library_book_lists"
  add_foreign_key "wish_lists", "students"
end
