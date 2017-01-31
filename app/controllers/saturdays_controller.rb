class SaturdaysController < ApplicationController
  before_action :set_saturday, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /saturdays
  # GET /saturdays.json
  def index
    @saturdays = Saturday.all
  end

  # GET /saturdays/1
  # GET /saturdays/1.json
  def show
  end

  # GET /saturdays/new
  def new
    @saturday = Saturday.new
  end

  # GET /saturdays/1/edit
  def edit
  end

  # POST /saturdays
  # POST /saturdays.json
  def create
    @saturday = Saturday.new(saturday_params)

    respond_to do |format|
      if @saturday.save
        format.html { redirect_to @saturday, notice: 'Saturday was successfully created.' }
        format.json { render :show, status: :created, location: @saturday }
      else
        format.html { render :new }
        format.json { render json: @saturday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saturdays/1
  # PATCH/PUT /saturdays/1.json
  def update
    respond_to do |format|
      if @saturday.update(saturday_params)
        format.html { redirect_to @saturday, notice: 'Saturday was successfully updated.' }
        format.json { render :show, status: :ok, location: @saturday }
      else
        format.html { render :edit }
        format.json { render json: @saturday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saturdays/1
  # DELETE /saturdays/1.json
  def destroy
    @saturday.destroy
    respond_to do |format|
      format.html { redirect_to saturdays_url, notice: 'Saturday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saturday
      @saturday = Saturday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saturday_params
      params.require(:saturday).permit(:issue_id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3)
    end
end
