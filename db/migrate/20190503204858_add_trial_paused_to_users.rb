class AddTrialPausedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trial_paused, :boolean, :default => false
  end
end
