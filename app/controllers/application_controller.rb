require 'mailchimp'
require 'gibbon'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :newsbar, :subscribers, :daily, :about

  layout :layout_by_resource

  def newsbar
    @newsbar = Newsbar.where(show: true).last
  end

  def subscribers 
    # API key in initializers/gibbon.rb

    #MAILCHIMP SUBSCRIBERS
    #@list_id = 'b6efc69609'
    #@listdata = Gibbon::Request.lists(@list_id).retrieve
    #@subscribers = ::ApplicationController.helpers.number_to_human(@listdata['stats']['member_count'], precision: 4,  separator: ',', units: {million: "", thousand: ""}).to_s
    
    @subscribers = '6,302'
  end

  def daily
    @daily = Post.where(category: 'MVG Daily Reading').where('publish_date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).last
    if !@daily.present?
      @daily = Post.last 
    end
    #@daily = @daily.id 
  end

  def about 
    @about = Page.where(name: 'About KV').last
  end

  def after_sign_in_path_for(resource)
    case resource
    when :member, Member
      moonvibeguide_issues_path
    when :admin, Admin
      issues_path
    else
      super
    end
	end

	def after_sign_out_path_for(resource)
    case resource
    when :member, Member
      moonvibeguide_path
    when :admin, Admin
      new_admin_session_path
    else
      super
    end
	end

	def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  private

  def layout_by_resource
    if devise_controller?
      "moon_vibe_guide"
    else
      "application"
    end
  end
end
