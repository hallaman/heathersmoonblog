class Testimonial < ActiveRecord::Base
	validates :title, presence: true
  validates :body, presence: true

  has_attached_file :image, styles: { thumb: ["400x400>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
