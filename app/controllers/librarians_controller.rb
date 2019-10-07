class LibrariansController < ApplicationController
  before_action :set_librarian, only: [:show, :edit, :update, :destroy]

  # GET /libraries
  # GET /libraries.json
  def index
    @librarians = Librarian.all
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @librarian = Librarian.new
  end

  # GET /libraries/1/edit
  def edit
    @librarian = Librarian.find(params[:id])
  end

  # POST /libraries
  # POST /libraries.json
  def create
    @librarian = Librarian.new(librarian_params)

    respond_to do |format|
      if @librarian.save
        format.html { redirect_to @librarian, notice: 'Librarian was successfully created.' }
        format.json { render :show, status: :created, location: @librarian }
      else
        format.html { render :new }
        format.json { render json: @librarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    @librarian = Librarian.find(params[:id])
    if @librarian.update(librarian_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @librarian.destroy
    respond_to do |format|
      format.html { redirect_to librarians_url, notice: 'Librarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_librarian
    @librarian = Librarian.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def librarian_params
    params.require(:librarian).permit(:email, :password, :name, :library_id)
  end
end
