class CreateLatestItems < ActiveRecord::Migration
  def change
    create_table :latest_items do |t|
      t.string :title
      t.string :link
      t.boolean :show
      t.binary :image

      t.timestamps null: false
    end
  end
end
