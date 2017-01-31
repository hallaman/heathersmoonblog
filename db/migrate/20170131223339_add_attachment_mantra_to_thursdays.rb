class AddAttachmentMantraToThursdays < ActiveRecord::Migration
  def self.up
    change_table :thursdays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :thursdays, :mantra
  end
end
