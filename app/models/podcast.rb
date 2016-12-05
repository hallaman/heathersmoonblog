class Podcast < ActiveRecord::Base
  has_many :podcast_details, autosave: true, dependent: :destroy

  accepts_nested_attributes_for :podcast_details,
		:reject_if => :all_blank,
		allow_destroy: true

	validates_associated :podcast_details

	validates :title, presence: true
  validates :main_image, presence: true

  # has_attached_file :main_image, styles: { thumb: ["400x300>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  # validates_attachment :main_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
