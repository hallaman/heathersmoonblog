class Issue < ActiveRecord::Base
  has_many :sidebars, autosave: true, dependent: :destroy
  has_many :mondays, autosave: true, dependent: :destroy
  has_many :tuesdays, autosave: true, dependent: :destroy
  has_many :wednesdays, autosave: true, dependent: :destroy
  has_many :thursdays, autosave: true, dependent: :destroy 
  has_many :fridays, autosave: true, dependent: :destroy
  has_many :saturdays, autosave: true, dependent: :destroy 
  has_many :sundays, autosave: true, dependent: :destroy

  accepts_nested_attributes_for :sidebars,
		:reject_if => lambda {|attributes| attributes['link'].blank?},
		allow_destroy: true
	accepts_nested_attributes_for :mondays,
	  :reject_if => :reject_mondays,
	  allow_destroy: true
	accepts_nested_attributes_for :tuesdays,
	  :reject_if => :reject_tuesdays,
	  allow_destroy: true
	accepts_nested_attributes_for :wednesdays,
	  :reject_if => :reject_wednesdays,
	  allow_destroy: true
	accepts_nested_attributes_for :thursdays,
	  :reject_if => :reject_thursdays,
	  allow_destroy: true
	accepts_nested_attributes_for :fridays,
	  :reject_if => :reject_fridays,
	  allow_destroy: true
	accepts_nested_attributes_for :saturdays,
	  :reject_if => :reject_saturdays,
	  allow_destroy: true
	accepts_nested_attributes_for :sundays,
	  :reject_if => :reject_sundays,
	  allow_destroy: true

  validates_associated :sidebars, :mondays, :tuesdays, :wednesdays, :thursdays, :fridays, :saturdays, :sundays

  validates :issue_number, presence: true
  validates :week, presence: true
  validates :main_image, presence: true
  validates :moon_phase, presence: true

  # has_attached_file :main_image, styles: { display: ["800x600>", :png], thumb: ["300x200>", :png] }, :convert_options => { :display => "-quality 70 -interlace Plane", :thumb => "-quality 70 -interlace Plane" }
  # validates_attachment :main_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
