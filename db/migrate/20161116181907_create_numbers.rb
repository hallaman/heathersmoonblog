class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :number
      t.text :meaning

      t.timestamps null: false
    end
  end
end
