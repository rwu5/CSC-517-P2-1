class StudentPageController < ApplicationController
  def show_libraries
  end

  def show_books
    @books = LibraryBookList.all
  end

  def book_details
    @books = LibraryBookList.all
  end

end
