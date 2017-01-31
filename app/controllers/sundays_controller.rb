class SundaysController < ApplicationController
  before_action :set_sunday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /sundays
  # GET /sundays.json
  def index
    @sundays = Sunday.all
  end

  # GET /sundays/1
  # GET /sundays/1.json
  def show
  end

  # GET /sundays/new
  def new
    @sunday = Sunday.new
  end

  # GET /sundays/1/edit
  def edit
  end

  # POST /sundays
  # POST /sundays.json
  def create
    @sunday = Sunday.new(sunday_params)

    respond_to do |format|
      if @sunday.save
        format.html { redirect_to @sunday, notice: 'Sunday was successfully created.' }
        format.json { render :show, status: :created, location: @sunday }
      else
        format.html { render :new }
        format.json { render json: @sunday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sundays/1
  # PATCH/PUT /sundays/1.json
  def update
    respond_to do |format|
      if @sunday.update(sunday_params)
        format.html { redirect_to @sunday, notice: 'Sunday was successfully updated.' }
        format.json { render :show, status: :ok, location: @sunday }
      else
        format.html { render :edit }
        format.json { render json: @sunday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sundays/1
  # DELETE /sundays/1.json
  def destroy
    @sunday.destroy
    respond_to do |format|
      format.html { redirect_to sundays_url, notice: 'Sunday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sunday
      @sunday = Sunday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sunday_params
      params.require(:sunday).permit(:issue_id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3)
    end
end
