class AddCalendarIdToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :calendar_id, :string
  end
end
