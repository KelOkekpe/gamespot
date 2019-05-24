module ExtendTrialService
  class << self

    def extend
      @user = current_user
      @user.update(trial_end_date: Date.today + 20.days)
    end

end
