class AddAttachmentMantraToFridays < ActiveRecord::Migration
  def self.up
    change_table :fridays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :fridays, :mantra
  end
end
