class AddEventIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :event_id, :string
  end
end
