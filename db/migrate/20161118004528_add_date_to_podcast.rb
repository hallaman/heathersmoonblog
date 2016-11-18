class AddDateToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :date, :string
  end
end
