class AddAttachmentMantraToSaturdays < ActiveRecord::Migration
  def self.up
    change_table :saturdays do |t|
      t.attachment :mantra
    end
  end

  def self.down
    remove_attachment :saturdays, :mantra
  end
end
