module GetPrice
  class MonthlyEarnings

    def initialize(user)
      @user = user
    end

    def execute
      monthly_earnings
    end

    def monthly_earnings
      if @user.user_type == 'cleaner'
        Booking.where(cleaner_id:@user.id, status:'completed').
        where('starts_at > ?', 30.days.ago).to_a.sum {|b| b.price.to_int}
      elsif @user.user_type == 'host'
        Booking.where(host_id:@user.id, status:'completed').
        where('starts_at > ?', 30.days.ago).to_a.sum {|b| b.price.to_int}
      end
    end

  end
end
