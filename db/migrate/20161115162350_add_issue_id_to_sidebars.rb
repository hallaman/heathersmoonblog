class AddIssueIdToSidebars < ActiveRecord::Migration
  def change
    add_column :sidebars, :issue_id, :integer
  end
end
