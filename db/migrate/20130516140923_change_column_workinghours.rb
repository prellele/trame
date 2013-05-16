class ChangeColumnWorkinghours < ActiveRecord::Migration
  def up
  	rename_column :users, :working_hours, :weekly_workinghours
  end

  def down
  	rename_column :users, :weekly_workinghours, :working_hours
  end
end
