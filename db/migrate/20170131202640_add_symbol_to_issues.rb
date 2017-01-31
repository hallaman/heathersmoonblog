class AddSymbolToIssues < ActiveRecord::Migration
  def change
  	add_column :issues, :symbol, :binary
  end
end
