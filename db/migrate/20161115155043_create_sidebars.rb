class CreateSidebars < ActiveRecord::Migration
  def change
    create_table :sidebars do |t|
      t.string :link
      t.string :title
      t.binary :image

      t.timestamps null: false
    end
  end
end
