class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :title
      t.references :host
      t.references :cleaner

      t.timestamps
    end
  end
end
