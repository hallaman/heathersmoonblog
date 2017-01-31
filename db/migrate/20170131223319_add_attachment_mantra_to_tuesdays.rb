class AddAttachmentMantraToTuesdays < ActiveRecord::Migration
  def self.up
    change_table :tuesdays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :tuesdays, :mantra
  end
end
