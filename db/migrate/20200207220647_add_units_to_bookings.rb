class AddUnitsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :unit_id, :integer, index: true
    add_foreign_key :bookings, :units, column: :unit_id
  end
end
