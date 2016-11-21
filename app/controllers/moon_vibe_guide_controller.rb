class MoonVibeGuideController < ApplicationController
	before_action :authenticate_member!, except: [:index]

  def index
  end

  def issues
  	@current = Issue.order("issue_number DESC").first
  	@past = Issue.where.not(id: @current).order("issue_number DESC")
    @podcasts = Podcast.order("id DESC")
  end

  def issue
  	@issue = Issue.find_by_id(params[:id])
  end

  def reading
    @podcast = Podcast.find_by_id(params[:id])
  end

  def view_reading
    @reading = PodcastDetail.find_by_id(params[:id])
  end

end
