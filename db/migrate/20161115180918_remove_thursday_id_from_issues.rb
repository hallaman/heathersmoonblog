class RemoveThursdayIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :thursday_id, :integer
  end
end
