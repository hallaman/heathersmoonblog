class ThursdaysController < ApplicationController
  before_action :set_thursday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  
  # GET /thursdays
  # GET /thursdays.json
  def index
    @thursdays = Thursday.all
  end

  # GET /thursdays/1
  # GET /thursdays/1.json
  def show
  end

  # GET /thursdays/new
  def new
    @thursday = Thursday.new
  end

  # GET /thursdays/1/edit
  def edit
  end

  # POST /thursdays
  # POST /thursdays.json
  def create
    @thursday = Thursday.new(thursday_params)

    respond_to do |format|
      if @thursday.save
        format.html { redirect_to @thursday, notice: 'Thursday was successfully created.' }
        format.json { render :show, status: :created, location: @thursday }
      else
        format.html { render :new }
        format.json { render json: @thursday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thursdays/1
  # PATCH/PUT /thursdays/1.json
  def update
    respond_to do |format|
      if @thursday.update(thursday_params)
        format.html { redirect_to @thursday, notice: 'Thursday was successfully updated.' }
        format.json { render :show, status: :ok, location: @thursday }
      else
        format.html { render :edit }
        format.json { render json: @thursday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thursdays/1
  # DELETE /thursdays/1.json
  def destroy
    @thursday.destroy
    respond_to do |format|
      format.html { redirect_to thursdays_url, notice: 'Thursday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thursday
      @thursday = Thursday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thursday_params
      params.require(:thursday).permit(:issue_id, :date, :entry, :affirmation, :moon_sign, :theme, :number_1, :number_2, :number_3)
    end
end
