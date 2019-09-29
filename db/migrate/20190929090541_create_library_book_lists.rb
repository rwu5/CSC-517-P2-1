class CreateLibraryBookLists < ActiveRecord::Migration[6.0]
  def change
    create_table :library_book_lists do |t|
      t.integer :number
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
