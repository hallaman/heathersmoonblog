class Issue < ActiveRecord::Base

  has_many :sidebars, autosave: true, dependent: :destroy
  has_many :numbers, autosave: true

  has_one :monday, autosave: true, dependent: :destroy
  has_one :tuesday, autosave: true, dependent: :destroy
  has_one :wednesday, autosave: true, dependent: :destroy
  has_one :thursday, autosave: true, dependent: :destroy 
  has_one :friday, autosave: true, dependent: :destroy
  has_one :saturday, autosave: true, dependent: :destroy 
  has_one :sunday, autosave: true, dependent: :destroy

  accepts_nested_attributes_for :sidebars,
		:reject_if => :all_blank,
		allow_destroy: true
	accepts_nested_attributes_for :monday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :tuesday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :wednesday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :thursday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :friday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :saturday,
	  :reject_if => :reject_day,
	  allow_destroy: true
	accepts_nested_attributes_for :sunday,
	  :reject_if => :reject_day,
	  allow_destroy: true

  validates_associated :sidebars, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  validates :issue_number, presence: true, uniqueness: { 
    message: "already being used" }
  validates :week, presence: true
  validates :moon_phase, presence: true

  def reject_day(attributes)
    attributes['date'].blank? && attributes['entry'].blank? && attributes['affirmation'].blank?
  end
end
