class AddPodcastLinkIdToSidebars < ActiveRecord::Migration
  def change
    add_column :sidebars, :podcast_link_id, :integer
  end
end
