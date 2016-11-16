class Friday < ActiveRecord::Base
	belongs_to :issue, foreign_key: "issue_id"

	validates :date, presence: true
  validates :entry, presence: true
  validates :affirmation, presence: true
  validates :moon_sign, presence: true
  validates :theme, presence: true
  validates :number_1, presence: true
end
