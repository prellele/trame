class AddArchivToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :archive, :boolean
  end
end
