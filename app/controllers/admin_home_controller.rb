class AdminHomeController < ApplicationController
	before_action :authenticate_admin!

  def index
    @newsbar = Newsbar.where(show: true).last
    @video = Video.where(show: true).last
  end

end