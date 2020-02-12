module GetPrice
  class PotentialEarnings

    def initialize(user)
      @user = user
    end

    def execute
      potential_earnings
    end

    def potential_earnings
      if @user.user_type == 'cleaner'
        Booking.where(cleaner_id:@user.id, status:'approved').
        where('starts_at > ?', Time.current).
        to_a.sum {|b| b.price.to_int}
      elsif @user.user_type == 'host'
        Booking.where(host_id:@user.id, status:'approved').
        where('starts_at > ?', Time.current).
        to_a.sum {|b| b.price.to_int}
      end
    end

  end
end
