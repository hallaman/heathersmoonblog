class MondaysController < ApplicationController
  before_action :set_monday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /mondays
  # GET /mondays.json
  def index
    @mondays = Monday.all
  end

  # GET /mondays/1
  # GET /mondays/1.json
  def show
  end

  # GET /mondays/new
  def new
    @monday = Monday.new
  end

  # GET /mondays/1/edit
  def edit
  end

  # POST /mondays
  # POST /mondays.json
  def create
    @monday = Monday.new(monday_params)

    respond_to do |format|
      if @monday.save
        format.html { redirect_to @monday, notice: 'Monday was successfully created.' }
        format.json { render :show, status: :created, location: @monday }
      else
        format.html { render :new }
        format.json { render json: @monday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mondays/1
  # PATCH/PUT /mondays/1.json
  def update
    respond_to do |format|
      if @monday.update(monday_params)
        format.html { redirect_to @monday, notice: 'Monday was successfully updated.' }
        format.json { render :show, status: :ok, location: @monday }
      else
        format.html { render :edit }
        format.json { render json: @monday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mondays/1
  # DELETE /mondays/1.json
  def destroy
    @monday.destroy
    respond_to do |format|
      format.html { redirect_to mondays_url, notice: 'Monday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monday
      @monday = Monday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monday_params
      params.require(:monday).permit(:issue_id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3)
    end
end
