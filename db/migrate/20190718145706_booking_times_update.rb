class BookingTimesUpdate < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_time, :datetime
    remove_column :bookings, :end_time, :datetime
    add_column :bookings, :starts_at, :datetime
    add_column :bookings, :ends_at, :datetime
  end
end
