namespace :state do
  desc "Update user state by checking trial_end_date"
    task :suspend_past_trial => :environment do
        User.where("trial_end_date < ?", Time.current).update_all(state:'suspended')
        puts "update successful"
      end
end
