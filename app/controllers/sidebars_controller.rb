class SidebarsController < ApplicationController
  before_action :set_sidebar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /sidebars
  # GET /sidebars.json
  def index
    @sidebars = Sidebar.all
  end

  # GET /sidebars/1
  # GET /sidebars/1.json
  def show
  end

  # GET /sidebars/new
  def new
    @sidebar = Sidebar.new
  end

  # GET /sidebars/1/edit
  def edit
  end

  # POST /sidebars
  # POST /sidebars.json
  def create
    @sidebar = Sidebar.new(sidebar_params)

    respond_to do |format|
      if @sidebar.save
        format.html { redirect_to @sidebar, notice: 'Sidebar was successfully created.' }
        format.json { render :show, status: :created, location: @sidebar }
      else
        format.html { render :new }
        format.json { render json: @sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidebars/1
  # PATCH/PUT /sidebars/1.json
  def update
    respond_to do |format|
      if @sidebar.update(sidebar_params)
        format.html { redirect_to @sidebar, notice: 'Sidebar was successfully updated.' }
        format.json { render :show, status: :ok, location: @sidebar }
      else
        format.html { render :edit }
        format.json { render json: @sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidebars/1
  # DELETE /sidebars/1.json
  def destroy
    @sidebar.destroy
    respond_to do |format|
      format.html { redirect_to sidebars_url, notice: 'Sidebar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidebar
      @sidebar = Sidebar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidebar_params
      params.require(:sidebar).permit(:link, :title, :image, :podcast_link_id)
    end
end
