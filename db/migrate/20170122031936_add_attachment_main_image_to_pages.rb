class AddAttachmentMainImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :pages, :main_image
  end
end
