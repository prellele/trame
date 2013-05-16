class AddTrackingsTable < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :description
      t.date :date
      t.integer :minutes
      t.boolean :billable
      t.references :project
      t.references :user
      t.timestamps
    end
  end
end
