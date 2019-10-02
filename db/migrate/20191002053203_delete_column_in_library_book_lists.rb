class DeleteColumnInLibraryBookLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :library_book_lists, :library_id
  end
end
