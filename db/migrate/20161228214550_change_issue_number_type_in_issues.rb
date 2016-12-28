class ChangeIssueNumberTypeInIssues < ActiveRecord::Migration
  def change
  	change_column(:issues, :issue_number, :integer)
  end
end
