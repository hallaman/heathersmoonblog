class FridaysController < ApplicationController
  before_action :set_friday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /fridays
  # GET /fridays.json
  def index
    @fridays = Friday.all
  end

  # GET /fridays/1
  # GET /fridays/1.json
  def show
  end

  # GET /fridays/new
  def new
    @friday = Friday.new
  end

  # GET /fridays/1/edit
  def edit
  end

  # POST /fridays
  # POST /fridays.json
  def create
    @friday = Friday.new(friday_params)

    respond_to do |format|
      if @friday.save
        format.html { redirect_to @friday, notice: 'Friday was successfully created.' }
        format.json { render :show, status: :created, location: @friday }
      else
        format.html { render :new }
        format.json { render json: @friday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fridays/1
  # PATCH/PUT /fridays/1.json
  def update
    respond_to do |format|
      if @friday.update(friday_params)
        format.html { redirect_to @friday, notice: 'Friday was successfully updated.' }
        format.json { render :show, status: :ok, location: @friday }
      else
        format.html { render :edit }
        format.json { render json: @friday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridays/1
  # DELETE /fridays/1.json
  def destroy
    @friday.destroy
    respond_to do |format|
      format.html { redirect_to fridays_url, notice: 'Friday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friday
      @friday = Friday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friday_params
      params.require(:friday).permit(:issue_id, :date, :entry, :affirmation, :moon_sign, :theme, :number_1, :number_2, :number_3)
    end
end
