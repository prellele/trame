class AddAttendancesTable < ActiveRecord::Migration
  def up
    create_table :attendances do |t|
      t.datetime :start
      t.integer :duration
      t.references :user
      t.timestamps
	end
  end

  def down
  	drop_table :attendances
  end
end
