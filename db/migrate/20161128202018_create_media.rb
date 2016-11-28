class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :link
      t.string :title
      t.binary :file

      t.timestamps null: false
    end
  end
end
