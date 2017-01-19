class AdminHomeController < ApplicationController
	before_action :authenticate_admin!

  def index
    @newsbar = Newsbar.where(show: true).last
    @video = Video.where(show: true).last

    @latestitems = LatestItem.where(show: true).limit(3)
  end

end