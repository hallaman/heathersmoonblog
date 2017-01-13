class NewsbarsController < ApplicationController
  before_action :set_newsbar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /newsbars
  # GET /newsbars.json
  def index
    @newsbars = Newsbar.order("id DESC").all
  end

  # GET /newsbars/1
  # GET /newsbars/1.json
  def show
  end

  # GET /newsbars/new
  def new
    @newsbar = Newsbar.new
  end

  # GET /newsbars/1/edit
  def edit
  end

  # POST /newsbars
  # POST /newsbars.json
  def create
    @newsbar = Newsbar.new(newsbar_params)

    respond_to do |format|
      if @newsbar.save
        format.html { redirect_to @newsbar, notice: 'Newsbar was successfully created.' }
        format.json { render :show, status: :created, location: @newsbar }
      else
        format.html { render :new }
        format.json { render json: @newsbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsbars/1
  # PATCH/PUT /newsbars/1.json
  def update
    respond_to do |format|
      if @newsbar.update(newsbar_params)
        format.html { redirect_to @newsbar, notice: 'Newsbar was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsbar }
      else
        format.html { render :edit }
        format.json { render json: @newsbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsbars/1
  # DELETE /newsbars/1.json
  def destroy
    @newsbar.destroy
    respond_to do |format|
      format.html { redirect_to newsbars_url, notice: 'Newsbar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsbar
      @newsbar = Newsbar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsbar_params
      params.require(:newsbar).permit(:message, :show)
    end
end
