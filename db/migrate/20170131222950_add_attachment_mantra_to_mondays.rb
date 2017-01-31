class AddAttachmentMantraToMondays < ActiveRecord::Migration
  def self.up
    change_table :mondays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :mondays, :mantra
  end
end
