class RemoveFridayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :friday_id, :integer
  end
end
