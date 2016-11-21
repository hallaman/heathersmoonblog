class RemoveReadingFromPodcastDetails < ActiveRecord::Migration
  def change
    remove_column :podcast_details, :reading, :boolean
  end
end
