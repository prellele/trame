class AddStartTimeToTrackings < ActiveRecord::Migration
  def change
    add_column :trackings, :start_time, :datetime
  end
end
