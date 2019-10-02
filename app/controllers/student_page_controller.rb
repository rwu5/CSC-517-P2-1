class StudentPageController < ApplicationController
  def show_libraries
  end

  def show_books
    @books = LibraryBookList.all
  end

  def book_details
    @books = LibraryBookList.all
  end

  def borrow
    # TODO: see if reach max number in current borrow list
    @book = LibraryBookList.all.find(params[:id])
    is_special_collection = Book.find(@book.book_id).is_special_collection
    if is_special_collection == 1
      add_hold_request(params[:id])
    elsif is_special_collection == 0
      book_stock_number = @book.number
      if book_stock_number > 0
        @borrow_history = BorrowHistory.new(student_id: current_student.id, book_id: @book.book_id)
        @borrow_history.save()
        @book.number = @book.number - 1
        @book.save()
        respond_to do |format|
          format.html { redirect_to s_books_path + "/" + @book.id.to_s, notice: 'Borrow this book successfully' }
          format.json { head :no_content }
        end
      elsif book_stock_number == 0
        add_hold_request(params[:id])
      end
    end
  end

  def add_hold_request(id)
    book = LibraryBookList.all.find(id)
    @hold_request = HoldList.new(student_id: current_student.id, book_id: book.book_id)
    @hold_request.save()
    @book.hold = @book.hold + 1
    @book.save()
    respond_to do |format|
      format.html { redirect_to s_books_path + "/" + book.id.to_s, notice: 'Hold Request Successfully Created' }
      format.json { head :no_content }
    end
  end

  def add_to_wish_list
    @wish_list = WishList.new(student_id: current_student.id, library_book_list_id: params[:id])
    @wish_list.save()
  end

  def wish_list
    @wish_lists = WishList.where(student_id: current_student.id)
  end

  def remove_from_wish_list
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy
    respond_to do |format|
      format.html { redirect_to s_wish_list_path, notice: 'Delete Successfully' }
      format.json { head :no_content }
    end
  end
end
