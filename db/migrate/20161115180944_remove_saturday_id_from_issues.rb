class RemoveSaturdayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :saturday_id, :integer
  end
end
