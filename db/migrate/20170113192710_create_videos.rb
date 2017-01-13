class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :embed_code
      t.boolean :show

      t.timestamps null: false
    end
  end
end
