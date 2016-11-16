class MoonVibeGuideController < ApplicationController
	before_action :authenticate_member!, except: [:index]

  def index
  end

  def issues
  	@issues = Issue.order("updated_at DESC").all
  end

  def issue
  	@issue = Issue.find_by_id(params[:id])
  end

end
