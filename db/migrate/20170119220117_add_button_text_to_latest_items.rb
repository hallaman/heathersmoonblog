class AddButtonTextToLatestItems < ActiveRecord::Migration
  def change
    add_column :latest_items, :button_text, :string
  end
end
