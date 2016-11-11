require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :setup_mcapi

  # def setup_mcapi
  #   @mc = Mailchimp::API.new('8bec904c50f70d1de0487cddd5a790e2-us11')
  # end

  def after_sign_in_path_for(member)
	  moon_vibe_guide_issues_path
	end

	def after_sign_out_path_for(member)
	  moon_vibe_guide_index_path
	end

	def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end
end
