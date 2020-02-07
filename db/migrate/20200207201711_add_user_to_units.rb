class AddUserToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :owner_id, :integer, index: true
    add_foreign_key :units, :users, column: :owner_id
  end
end
