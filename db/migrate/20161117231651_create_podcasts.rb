class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.binary :main_image
      t.text :description

      t.timestamps null: false
    end
  end
end
