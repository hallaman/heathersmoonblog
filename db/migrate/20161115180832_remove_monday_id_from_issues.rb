class RemoveMondayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :monday_id, :integer
  end
end
