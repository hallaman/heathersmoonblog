class AddAttachmentMainImageToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :issues, :main_image
  end
end
