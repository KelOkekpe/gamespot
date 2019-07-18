class RemoveEndsAt < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :ends_at, :datetime
  end
end
