class AddAttachmentMantraToSundays < ActiveRecord::Migration
  def self.up
    change_table :sundays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :sundays, :mantra
  end
end
