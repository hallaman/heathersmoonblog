class AddAttachmentImageToPodcastDetails < ActiveRecord::Migration
  def self.up
    change_table :podcast_details do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :podcast_details, :image
  end
end
