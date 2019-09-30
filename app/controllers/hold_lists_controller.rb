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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold_list
      @hold_list = HoldList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hold_list_params
      params.require(:hold_list).permit(:student_id, :book_id, :library_id)
    end
end
