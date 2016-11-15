class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_number
      t.string :week
      t.binary :main_image
      t.string :moon_phase
      t.text :welcome
      t.integer :sidebar_id
      t.integer :monday_id
      t.integer :tuesday_id
      t.integer :wednesday_id
      t.integer :thursday_id
      t.integer :friday_id
      t.integer :saturday_id
      t.integer :sunday_id

      t.timestamps null: false
    end
  end
end
