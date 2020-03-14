module PagesHelper

  def upcoming_bookings_card_partial_path
    if host
      @upcoming_bookings = Booking.where(host_id:current_user.id).map{|booking| booking}
    elsif cleaner
      @upcoming_bookings = Booking.where(cleaner_id:current_user.id).map{|booking| booking}
    end
    'pages/dashboard/cards/upcoming_bookings_card'
  end


  def earnings_card_partial_path
    'pages/dashboard/cards/earnings_card'
  end

  def pending_bookings_card_partial_path
    'pages/dashboard/cards/pending_bookings_card'
  end

  def approved_bookings_card_partial_path
    'pages/dashboard/cards/approved_bookings_card'
  end

  def calendar_card_partial_path
    'pages/dashboard/cards/calendar_card'
  end

  def dashboard_helper_path
     render 'pages/dashboard/dashboard'
  end

end
