class UserDecorator < SimpleDelegator

  def days_left
    if state == 'paused'
      days_left = 'Trial Paused'
    elsif state == 'suspended'
      days_left = 'Account Suspended'
    elsif state == 'active'
      days_left = 'Account Active'
    elsif state == 'trial' && trial_end_date > Date.current
      days_left = (trial_end_date - Time.current) / 86400
      days_left += 1
      days_left.to_i
    else state == 'trial' && trial_end_date < Date.current
      days_left = '0'
    end
  end


  def upcoming_bookings
    if current_user.user_type == 'host'
      bookings = Booking.select{|b| b.host == current_user}.map
    elsif current_user.user_type == 'cleaner'
      bookings = Booking.select{|b| b.cleaner == current_user}.map
    end
  end
end
