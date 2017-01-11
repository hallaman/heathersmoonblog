class Newsbar < ActiveRecord::Base
	validates :message, presence: true
end
