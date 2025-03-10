class HoldListsController < ApplicationController
  before_action :set_hold_list, only: [:show, :edit, :update, :destroy]

  # GET /hold_lists
  # GET /hold_lists.json
  def index
    @hold_lists = HoldList.all
  end

  # GET /hold_lists/1
  # GET /hold_lists/1.json
  def show
  end

  # GET /hold_lists/new
  def new
    @hold_list = HoldList.new
  end

  # GET /hold_lists/1/edit
  def edit
  end

  # POST /hold_lists
  # POST /hold_lists.json
  def create
    @hold_list = HoldList.new(hold_list_params)

    respond_to do |format|
      if @hold_list.save
        format.html { redirect_to @hold_list, notice: 'Hold list was successfully created.' }
        format.json { render :show, status: :created, location: @hold_list }
      else
        format.html { render :new }
        format.json { render json: @hold_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hold_lists/1
  # PATCH/PUT /hold_lists/1.json
  def update
    respond_to do |format|
      if @hold_list.update(hold_list_params)
        format.html { redirect_to @hold_list, notice: 'Hold list was successfully updated.' }
        format.json { render :show, status: :ok, location: @hold_list }
      else
        format.html { render :edit }
        format.json { render json: @hold_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hold_lists/1
  # DELETE /hold_lists/1.json
  def destroy
    @hold_list.destroy
    respond_to do |format|
      format.html { redirect_to hold_lists_url, notice: 'Hold list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deny_hold_request
    @hold_list = HoldList.find(params[:id])
    @student = Student.find(@hold_list.student_id)
    # TODO: email this student
    @hold_list.destroy
    respond_to do |format|
      format.html { redirect_to hold_lists_url, notice: 'Deny!' }
      format.json { head :no_content }
    end
  end

  def approve_hold_request
    @hold_list = HoldList.find(params[:id])
    if LibraryBookList.find_by_book_id(@hold_list.book_id).number == 0
      respond_to do |format|
        format.html { redirect_to hold_lists_url, notice: 'Failed! No book left' }
        format.json { head :no_content }
      end
      return -1
    end
    if StudentCurrentBorrowList.where(student_id: @hold_list.student_id).size >= Student.find(@hold_list.student_id).education_level * 2
      respond_to do |format|
        format.html { redirect_to hold_lists_url, notice: 'Failed! This student reached max borrowed number' }
        format.json { head :no_content }
      end
      return 1
    end
    book_id = @hold_list.book_id
    @borrow_history = BorrowHistory.new(student_id: @hold_list.student_id, book_id: book_id)
    @borrow_history.save
    @current_list = StudentCurrentBorrowList.new(student_id: @hold_list.student_id, book_id: book_id)
    @current_list.save
    # TODO: email this student
    @hold_list.destroy
    respond_to do |format|
      format.html { redirect_to hold_lists_url, notice: 'Approved!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hold_list
    @hold_list = HoldList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hold_list_params
    params.require(:hold_list).permit(:student_id, :book_id)
  end
end
