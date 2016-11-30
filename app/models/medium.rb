class Medium < ActiveRecord::Base
	has_attached_file :file, styles: {  thumb: ["120x120>", :png] }, :convert_options => { :thumb => "-quality 70 -interlace Plane" }

	validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
