class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
     rename_column :bookings, :title, :notes
  end
end
