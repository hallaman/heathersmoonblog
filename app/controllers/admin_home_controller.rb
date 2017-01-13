class AdminHomeController < ApplicationController

  def index
    @newsbar = Newsbar.where(show: true).last
  end

end