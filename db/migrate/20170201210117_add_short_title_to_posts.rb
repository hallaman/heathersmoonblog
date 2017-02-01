class AddShortTitleToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :short_title, :string
  end
end
