class CreatePodcastDetails < ActiveRecord::Migration
  def change
    create_table :podcast_details do |t|
      t.string :title
      t.binary :image
      t.string :link
      t.boolean :reading
      t.integer :podcast_id

      t.timestamps null: false
    end
  end
end
