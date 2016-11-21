class PodcastDetail < ActiveRecord::Base
	belongs_to :podcast, foreign_key: "podcast_id"

	validates :title, presence: true

  has_attached_file :image, styles: { thumb: ["200x200>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
