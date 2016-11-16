class RemoveTuesdayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :tuesday_id, :integer
  end
end
