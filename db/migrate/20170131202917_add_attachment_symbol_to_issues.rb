class AddAttachmentSymbolToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :symbol
    end
  end

  def self.down
    remove_attachment :issues, :symbol
  end
end
