class Page < ActiveRecord::Base
	validates :body, presence: true

  has_attached_file :main_image, styles: { thumb: ["400x300>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :main_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
