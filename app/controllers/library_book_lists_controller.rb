class LibraryBookListsController < ApplicationController
  before_action :set_library_book_list, only: [:show, :edit, :update, :destroy]

  # GET /library_book_lists
  # GET /library_book_lists.json
  def index
    @library_book_lists = LibraryBookList.all
  end

  # GET /library_book_lists/1
  # GET /library_book_lists/1.json
  def show
  end

  # GET /library_book_lists/new
  def new
    @library_book_list = LibraryBookList.new
  end

  # GET /library_book_lists/1/edit
  def edit
  end

  # POST /library_book_lists
  # POST /library_book_lists.json
  def create
    @library_book_list = LibraryBookList.new(library_book_list_params)

    respond_to do |format|
      if @library_book_list.save
        format.html { redirect_to @library_book_list, notice: 'Library book list was successfully created.' }
        format.json { render :show, status: :created, location: @library_book_list }
      else
        format.html { render :new }
        format.json { render json: @library_book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_book_lists/1
  # PATCH/PUT /library_book_lists/1.json
  def update
    respond_to do |format|
      if @library_book_list.update(library_book_list_params)
        format.html { redirect_to books_path, notice: 'Library book list was successfully updated.' }
        format.json { render :show, status: :ok, location: @library_book_list }
      else
        format.html { render :edit }
        format.json { render json: @library_book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_book_lists/1
  # DELETE /library_book_lists/1.json
  def destroy
    @library_book_list.destroy
    respond_to do |format|
      format.html { redirect_to books_path, notice: 'Library book list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_library_book_list
    @library_book_list = LibraryBookList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def library_book_list_params
    params.require(:library_book_list).permit(:number, :book_id)
  end
end
