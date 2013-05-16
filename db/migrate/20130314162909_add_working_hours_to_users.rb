class AddWorkingHoursToUsers < ActiveRecord::Migration
  def change
    add_column :users, :working_hours, :decimal
  end
end
