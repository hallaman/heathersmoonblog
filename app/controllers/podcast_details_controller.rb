class PodcastDetailsController < ApplicationController
  before_action :set_podcast_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /podcast_details
  # GET /podcast_details.json
  def index
    @podcast_details = PodcastDetail.all
  end

  # GET /podcast_details/1
  # GET /podcast_details/1.json
  def show
  end

  # GET /podcast_details/new
  def new
    @podcast_detail = PodcastDetail.new
  end

  # GET /podcast_details/1/edit
  def edit
  end

  # POST /podcast_details
  # POST /podcast_details.json
  def create
    @podcast_detail = PodcastDetail.new(podcast_detail_params)

    respond_to do |format|
      if @podcast_detail.save
        format.html { redirect_to @podcast_detail, notice: 'Podcast detail was successfully created.' }
        format.json { render :show, status: :created, location: @podcast_detail }
      else
        format.html { render :new }
        format.json { render json: @podcast_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcast_details/1
  # PATCH/PUT /podcast_details/1.json
  def update
    respond_to do |format|
      if @podcast_detail.update(podcast_detail_params)
        format.html { redirect_to @podcast_detail, notice: 'Podcast detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @podcast_detail }
      else
        format.html { render :edit }
        format.json { render json: @podcast_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcast_details/1
  # DELETE /podcast_details/1.json
  def destroy
    @podcast_detail.destroy
    respond_to do |format|
      format.html { redirect_to podcast_details_url, notice: 'Podcast detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast_detail
      @podcast_detail = PodcastDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_detail_params
      params.require(:podcast_detail).permit(:title, :image, :link, :podcast_id)
    end
end
