class RemoveSundayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :sunday_id, :integer
  end
end
