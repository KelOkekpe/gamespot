module BookingsHelper

  def render_booking(booking)
    if booking.status == 'pending'
      render partial: 'booking', locals: { booking: booking }
    elsif booking.status == 'approved'
      render partial: 'bookings/indexes/approved_index', locals: { booking: booking }
    end
  end

  def outgoing_request(booking)
    booking.requested_by_id == current_user.id
  end

  def incoming_request(booking)
    booking.requested_by_id != current_user.id
  end

  def approved(booking)
    booking.status == 'approved'
  end

  def host
    current_user.user_type == 'host'
  end

  def cleaner
    current_user.user_type == 'cleaner'
  end

  
end
