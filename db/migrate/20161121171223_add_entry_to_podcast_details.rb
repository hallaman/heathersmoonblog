class AddEntryToPodcastDetails < ActiveRecord::Migration
  def change
    add_column :podcast_details, :entry, :text
  end
end
