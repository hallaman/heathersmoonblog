class LatestItemsController < ApplicationController
  before_action :set_latest_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  
  # GET /latest_items
  # GET /latest_items.json
  def index
    @latest_items = LatestItem.all
  end

  # GET /latest_items/1
  # GET /latest_items/1.json
  def show
  end

  # GET /latest_items/new
  def new
    @latest_item = LatestItem.new
  end

  # GET /latest_items/1/edit
  def edit
  end

  # POST /latest_items
  # POST /latest_items.json
  def create
    @latest_item = LatestItem.new(latest_item_params)

    respond_to do |format|
      if @latest_item.save
        format.html { redirect_to @latest_item, notice: 'Latest item was successfully created.' }
        format.json { render :show, status: :created, location: @latest_item }
      else
        format.html { render :new }
        format.json { render json: @latest_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /latest_items/1
  # PATCH/PUT /latest_items/1.json
  def update
    respond_to do |format|
      if @latest_item.update(latest_item_params)
        format.html { redirect_to @latest_item, notice: 'Latest item was successfully updated.' }
        format.json { render :show, status: :ok, location: @latest_item }
      else
        format.html { render :edit }
        format.json { render json: @latest_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /latest_items/1
  # DELETE /latest_items/1.json
  def destroy
    @latest_item.destroy
    respond_to do |format|
      format.html { redirect_to latest_items_url, notice: 'Latest item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latest_item
      @latest_item = LatestItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latest_item_params
      params.require(:latest_item).permit(:title, :link, :show, :image, :button_text)
    end
end
