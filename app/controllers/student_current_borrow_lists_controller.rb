class StudentCurrentBorrowListsController < ApplicationController
  before_action :set_student_current_borrow_list, only: [:show, :edit, :update, :destroy]

  # GET /student_current_borrow_lists
  # GET /student_current_borrow_lists.json
  def index
    @student_current_borrow_lists = StudentCurrentBorrowList.all
  end

  # GET /student_current_borrow_lists/1
  # GET /student_current_borrow_lists/1.json
  def show
  end

  # GET /student_current_borrow_lists/new
  def new
    @student_current_borrow_list = StudentCurrentBorrowList.new
  end

  # GET /student_current_borrow_lists/1/edit
  def edit
  end

  # POST /student_current_borrow_lists
  # POST /student_current_borrow_lists.json
  def create
    @student_current_borrow_list = StudentCurrentBorrowList.new(student_current_borrow_list_params)

    respond_to do |format|
      if @student_current_borrow_list.save
        format.html { redirect_to @student_current_borrow_list, notice: 'Student current borrow list was successfully created.' }
        format.json { render :show, status: :created, location: @student_current_borrow_list }
      else
        format.html { render :new }
        format.json { render json: @student_current_borrow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_current_borrow_lists/1
  # PATCH/PUT /student_current_borrow_lists/1.json
  def update
    respond_to do |format|
      if @student_current_borrow_list.update(student_current_borrow_list_params)
        format.html { redirect_to @student_current_borrow_list, notice: 'Student current borrow list was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_current_borrow_list }
      else
        format.html { render :edit }
        format.json { render json: @student_current_borrow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_current_borrow_lists/1
  # DELETE /student_current_borrow_lists/1.json
  def destroy
    @student_current_borrow_list.destroy
    respond_to do |format|
      format.html { redirect_to student_current_borrow_lists_url, notice: 'Student current borrow list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_current_borrow_list
      @student_current_borrow_list = StudentCurrentBorrowList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_current_borrow_list_params
      params.require(:student_current_borrow_list).permit(:student_id, :book_id)
    end
end
