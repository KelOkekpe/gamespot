module GetPrice
  class TotalEarnings

    def initialize(user)
      @user = user
    end

    def execute
      total_earnings
    end

    def total_earnings
      if @user.user_type == 'cleaner'
        Booking.where(cleaner_id:@user.id, status:'completed').
        to_a.sum {|b| b.price.to_int}
      elsif @user.user_type == 'host'
        Booking.where(host_id:@user.id, status:'completed').
        to_a.sum {|b| b.price.to_int}
      end
    end

  end
end
