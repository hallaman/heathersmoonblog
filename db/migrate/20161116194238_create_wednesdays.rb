class CreateWednesdays < ActiveRecord::Migration
  def change
    create_table :wednesdays do |t|
      t.integer :issue_id
      t.string :date
      t.text :entry
      t.text :affirmation
      t.string :moon_sign
      t.string :theme
      t.integer :number_1
      t.integer :number_2
      t.integer :number_3

      t.timestamps null: false
    end
  end
end
