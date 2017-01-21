require 'instagram'

class WelcomeController < ApplicationController
  def index
  	@video = Video.where(show: true).last
  	
  	# daily reading
  	@daily_reading = Post.where(category: 'MVG Daily Reading').where('publish_date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).first

    if @daily_reading.present?
      @daily_reading_text = @daily_reading.body
    else 
      @stay_tuned = '<p>Please stay tuned.</p>'
    end

    @latest_items = LatestItem.where(show: true).limit(3)

    client = Instagram.client(:access_token => '1517317818.1677ed0.daa3778c68b149cc82e9608c931a59d6')
    @insta = client.user_recent_media
  end
end
