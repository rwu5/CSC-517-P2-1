class AddColumnsToLibraryBookList < ActiveRecord::Migration[6.0]
  def change
    add_column :library_book_lists, :hold, :integer
  end
end
