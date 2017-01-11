require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :newsbar

  def newsbar
    @newsbar = Newsbar.where(show: true).last
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
end
