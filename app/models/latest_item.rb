class LatestItem < ActiveRecord::Base
	validates :title, presence: true
  validates :link, presence: true

  has_attached_file :image, styles: { thumb: ["200x200>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
