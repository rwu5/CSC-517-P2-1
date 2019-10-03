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
    book_stock = LibraryBookList.all.find(params[:id])
    is_special_collection = Book.find(book_stock.book_id).is_special_collection
    @my_borrowed_list = StudentCurrentBorrowList.where(student_id: current_student.id)
    if @my_borrowed_list.size >= 3
      respond_to do |format|
        format.html { redirect_to s_books_path + "/" + book_stock.id.to_s, notice: 'Max number reached' }
        format.json { head :no_content }
      end
      return 1
    end

    if is_special_collection == 1
      book_stock = LibraryBookList.all.find(params[:id])
      HoldList.new(student_id: current_student.id, book_id: book_stock.book_id).save()
      respond_to do |format|
        format.html { redirect_to s_books_path + "/" + book_stock.id.to_s, notice: 'Hold Request Successfully Created' }
        format.json { head :no_content }
      end
      return 1
    end

    if is_special_collection == 0
      @book_stock = LibraryBookList.all.find(params[:id])
      book_stock_number = @book_stock.number
      if book_stock_number > 0
        BorrowHistory.new(student_id: current_student.id, book_id: @book_stock.book_id).save()
        StudentCurrentBorrowList.new(student_id: current_student.id, book_id: @book_stock.book_id).save()
        @book_stock.number -= 1
        @book_stock.save()
        respond_to do |format|
          format.html { redirect_to s_books_path + "/" + @book_stock.id.to_s, notice: 'Borrow this book successfully' }
          format.json { head :no_content }
        end

      elsif book_stock_number == 0
        HoldList.new(student_id: current_student.id, book_id: @book_stock.book_id).save()
        respond_to do |format|
          format.html { redirect_to s_books_path + "/" + @book_stock.id.to_s, notice: 'Create Hold Request' }
          format.json { head :no_content }
        end
      end
    end
  end


  def return_book
    @this_book_log = StudentCurrentBorrowList.find(params[:id])
    @library_book_list = LibraryBookList.where(book_id: @this_book_log.book_id).first
    @library_book_list.number += 1
    @library_book_list.save()
    @this_book_log.destroy
    #   TODO: calculate fine in the view

    is_special_collection = Book.find(@library_book_list.book_id).is_special_collection
    if is_special_collection == 0
      if @library_book_list.hold > 0
        hold_students = HoldList.where(book_id: @library_book_list.book_id).order('created_at DESC')
        hold_students do |h|
          student = Student.find(h.student_id)
          @student_borrowed_list = StudentCurrentBorrowList.where(student_id: student.id)
          # this student reach max borrow number, change 2 later
          if @student_borrowed_list.size > 2
            next
          elsif @student_borrowed_list.size <= 2
            @new_student_borrowed_list = StudentCurrentBorrowList.new(student_id: h.student_id, book_id: h.book_id)
            @new_student_borrowed_list.save
            @new_borrow_history = BorrowHistory.new(student_id: h.student_id, book_id: h.book_id)
            @new_borrow_history.save
            #   TODO: email this student
            @library_book_list.number -= 1
            @library_book_list.hold -= 1
            @library_book_list.save()
            h.destroy
          end
        end
      end
    end

    # Check current hold list
    # current_hold_lists = HoldList.where(student_id: current_student.id).order('created_at DESC');
    HoldList.where(student_id: current_student.id).order('created_at DESC') do |c|
      #   check if this book is available
      available_num = LibraryBookList.where(book_id: c.book_id).number
      if available_num > 0
        LibraryBookList.where(book_id: c.book_id).number -= 1
        @borrow_history = BorrowHistory.new(student_id: current_student.id, book_id: c.book_id)
        @borrow_history.save()
        @current_borrow = StudentCurrentBorrowList.new(student_id: current_student.id, book_id: c.book_id)
      end
    end

    respond_to do |format|
      format.html { redirect_to s_books_path + "/" + @library_book_list.id.to_s, notice: 'Return successfully' }
      format.json { head :no_content }
    end

  end


  def add_hold_request(id)
    book = LibraryBookList.all.find(id)
    @hold_request = HoldList.new(student_id: current_student.id, book_id: book.book_id)
    @hold_request.save()
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

  def current_borrowed_list
    @current_borrowed_list = StudentCurrentBorrowList.where(student_id: current_student.id)
  end

  def request_list
    @books = HoldList.where(student_id: current_student.id)
  end

  def remove_from_request_list
    @request = HoldList.find(params[:id])
    @request.destroy
    respond_to do |format|
      format.html { redirect_to s_request_list_path, notice: 'Delete Successfully' }
      format.json { head :no_content }
    end
  end
end
