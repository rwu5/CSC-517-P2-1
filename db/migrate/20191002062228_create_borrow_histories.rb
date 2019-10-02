class CreateBorrowHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :borrow_histories do |t|
      t.references :student, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
