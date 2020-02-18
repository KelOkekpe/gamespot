class BookingDecorator < SimpleDelegator

  def initialize(current_user)
    @current_user = current_user
  end

  def pending(current_user)
    if current_user.user_type == 'host'
      bookings = Booking.where(host_id:current_user.id, status:'pending').count
    elsif current_user.user_type == 'cleaner'
      bookings = Booking.where(cleaner_id:current_user.id, status:'pending').count
    end
  end

  def approved(current_user)
    if current_user.user_type == 'host'
      bookings = Booking.where(host_id:current_user.id, status:'approved').count
    elsif current_user.user_type == 'cleaner'
      bookings = Booking.where(cleaner_id:current_user.id, status:'approved').count
    end
  end

end
