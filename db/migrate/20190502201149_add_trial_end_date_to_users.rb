class AddTrialEndDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trial_end_date, :datetime, :default => Time.now + 7.days
  end
end
