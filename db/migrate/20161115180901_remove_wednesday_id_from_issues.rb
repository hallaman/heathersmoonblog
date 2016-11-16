class RemoveWednesdayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :wednesday_id, :integer
  end
end
