class Monday < ActiveRecord::Base
	belongs_to :issue, foreign_key: "issue_id"

	validates :date, presence: true
  validates :entry, presence: true
  validates :moon_sign, presence: true
  validates :theme, presence: true
  validates :number_1, presence: true

  has_attached_file :mantra, styles: {  thumb: ["1000x1000>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :mantra, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
