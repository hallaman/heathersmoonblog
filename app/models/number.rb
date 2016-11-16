class Number < ActiveRecord::Base
	validates :number, presence: true
  validates :meaning, presence: true
end
