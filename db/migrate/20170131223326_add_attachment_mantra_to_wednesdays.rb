class AddAttachmentMantraToWednesdays < ActiveRecord::Migration
  def self.up
    change_table :wednesdays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :wednesdays, :mantra
  end
end
