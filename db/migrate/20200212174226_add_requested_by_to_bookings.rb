class AddRequestedByToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :requested_by_id, :integer, index: true
    add_foreign_key :bookings, :users, column: :requested_by_id
  end
end
