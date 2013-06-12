class AddRightsRolesTables < ActiveRecord::Migration
  def up

    create_table :rights do |t|
      t.string :name
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :rights_roles, :id => false do |t|
      t.integer :right_id
      t.integer :role_id
    end

    create_table :roles_users, :id => false do |t|
      t.integer :role_id
      t.integer :user_id
    end

    remove_column :users, :admin

    sysadmin = Role.create :name => 'Systemadministrator'
    ['ViewProjects', 'EditProjects', 'ViewRoles', 'EditRoles', 'ViewUsers', 'EditUsers', 
    	'ViewAllTrackings', 'EditAllTrackings',	'ViewAllAttendances', 'EditAllAttendances'].each do |name|
      sysadmin.rights << Right.create(name: name)
    end

  end

  def down
    drop_table :roles
    drop_table :rights
    drop_table :rights_roles
    drop_table :roles_users

    add_column :users, :admin, :boolean, default: false

  end
end