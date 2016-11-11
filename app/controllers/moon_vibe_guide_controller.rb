class MoonVibeGuideController < ApplicationController
	before_action :authenticate_member!, except: [:index]

  def index
  end

end
