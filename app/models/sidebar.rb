class Sidebar < ActiveRecord::Base
	belongs_to :issue, foreign_key: "issue_id"

	validates :title, presence: true
  validates :link, presence: true
	
	#has_attached_file :image, styles: { display: ["800x600>", :png], thumb: ["300x200>", :png] }, :convert_options => { :display => "-quality 70 -interlace Plane", :thumb => "-quality 70 -interlace Plane" }
  #validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
