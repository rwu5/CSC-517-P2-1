class CreateStudentCurrentBorrowLists < ActiveRecord::Migration[6.0]
  def change
    create_table :student_current_borrow_lists do |t|
      t.references :student, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
