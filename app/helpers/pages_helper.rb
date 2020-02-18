module PagesHelper

  def upcoming_bookings_card_partial_path
    @user = current_user
    if current_user.user_type == 'host'
      @upcoming_bookings =  Booking.where(host_id:current_user.id).map{|booking| booking}
    elsif current_user.user_type == 'cleaner'
        @upcoming_bookings =  Booking.where(cleaner_id:current_user.id).map{|booking| booking}
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

  # def user_table_helper_path
  #   if current_user.user_type == 'host'
  #     @users = User.where(:user_type => 'cleaner')
  #     render 'pages/users/user_table'
  #   else
  #     @users = User.where(:user_type=>'host')
  #     render 'pages/users/cleaner_user_table'
  #   end
  # end

end
