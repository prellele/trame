class AddPrenameSurnameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :prename
      t.string :surname
    end
  end
end
