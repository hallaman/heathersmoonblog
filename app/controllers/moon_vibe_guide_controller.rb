class MoonVibeGuideController < ApplicationController
	before_action :authenticate_member!, except: [:index, :daily_reading]

  layout 'moon_vibe_guide'

  def index
  end

  def issues
  	@current = Issue.order("issue_number DESC").first
  	@past = Issue.where.not(id: @current).order("issue_number DESC")
    @podcasts = Podcast.order("id DESC")
  end

  def issue
  	@issue = Issue.find_by_id(params[:id])
    @last = Issue.order("issue_number DESC").first
    @first = Issue.order("issue_number ASC").first
    @next = Issue.where('issue_number > ?', @issue.issue_number).order("issue_number ASC").first  
    @prev = Issue.where('issue_number < ?', @issue.issue_number).order("issue_number ASC").last

    @prev_issue = @prev.present? ? @prev : @last
    @next_issue = @next.present? ? @next : @first
  end

  def daily_reading
    @daily_reading = Post.where(category: 'MVG Daily Reading').where('publish_date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).first

    @daily_reading_text = @daily_reading.present? ? @daily_reading.body : 'Please stay tuned.'

    if @daily_reading.body.present?
      @daily_reading_text = @daily_reading.body
    else 
      @stay_tuned = '<p>Please stay tuned.</p>'
    end

  end

  def reading
    @podcast = Podcast.find_by_id(params[:id])
  end

  def view_reading
    @reading = PodcastDetail.find_by_id(params[:id])
  end

end
