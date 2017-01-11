class CreateNewsbars < ActiveRecord::Migration
  def change
    create_table :newsbars do |t|
      t.text :message
      t.boolean :show

      t.timestamps null: false
    end
  end
end
