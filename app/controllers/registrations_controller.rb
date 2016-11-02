# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  after_filter :check_mailchimp

  protected

  def check_mailchimp
    if resource.persisted? # user is created successfuly
    	# contact MailChimp
    	# update users table
    	# is user still subscribed?
    	# if subscribed then send to MVG
    	# if user inactive then send to intro MVG page

      #resource.accounts.create(attributes_for_account)
      puts "MailChimp checked"
      return
    end
 end
end 