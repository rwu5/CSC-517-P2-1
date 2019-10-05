class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /libraries
  # GET /libraries.json
  def index
    @students = Student.all
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @student = Student.new
  end

  # GET /libraries/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /libraries
  # POST /libraries.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    @student = Student.find(params[:id])
    if @student.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :university_id, :location, :max_day_can_borrow, :overdue_fine)
  end
end
