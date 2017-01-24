class AdminHomeController < ApplicationController
	before_action :authenticate_admin!

  def index
    @newsbar = Newsbar.last
    @video = Video.where(show: true).last

    @latestitems = LatestItem.where(show: true).limit(3)
    @testimonials = Testimonial.where(show: true)

  end

end