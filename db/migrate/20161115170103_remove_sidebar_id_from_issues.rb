class RemoveSidebarIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :sidebar_id, :integer
  end
end
