class AddAttachmentImageToLatestItems < ActiveRecord::Migration
  def self.up
    change_table :latest_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :latest_items, :image
  end
end
