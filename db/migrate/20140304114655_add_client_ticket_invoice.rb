class AddClientTicketInvoice < ActiveRecord::Migration
  def up

    create_table :clients do |t|
      t.string :name
      t.references :project
      t.timestamps
    end

    create_table :tickets do |t|
      t.string :name
      t.string :description
      t.string :priority
      t.date :deadline
      t.boolean :closed
      t.references :project
      t.references :user
      t.timestamps
    end

    create_table :invoices do |t|
      t.references :client
      t.references :user
      t.timestamps
    end

    create_table :invoices_trackings, :id => false do |t|
      t.integer :invoice_id
      t.integer :tracking_id
    end

    add_column :trackings, :billed, :boolean, default: false
    add_column :projects, :hourly_rate, :decimal
    add_column :projects, :client_id, :integer

    sysadmin = Role.find 1
    ['ViewClients', 'EditClients', 'ViewInvoices', 'EditInvoices', 'ViewTickets', 'EditTickets'].each do |name|
      sysadmin.rights << Right.create(name: name)
    end

  end

  def down
    drop_table :clients
    drop_table :tickets
    drop_table :invoices
    drop_table :invoices_trackings

    remove_column :trackings, :billed
    remove_column :projects, :hourly_rate
    remove_column :projects, :client_id
  end
end