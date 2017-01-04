class Post < ActiveRecord::Base
	has_many :comments, autosave: true, dependent: :destroy

	validates :title, presence: true
  validates :publish_date, presence: true

  has_attached_file :main_image, styles: { thumb: ["800x600>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :main_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_presence :main_image

  attr_accessor :main_image_file_name
  attr_accessor :main_image_content_type
  attr_accessor :main_image_file_size
  attr_accessor :main_image_updated_at
end
