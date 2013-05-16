class RemoveDateFromTrackings < ActiveRecord::Migration
  def change
  	remove_column :trackings, :date
  end
end
