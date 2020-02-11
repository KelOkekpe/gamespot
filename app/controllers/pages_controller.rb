class PagesController < ApplicationController
  ########################  ########################  ########################  ########################  ########################  ########################
  def index
  end

  def homepage
     #this shows 5 random posts
    @posts = Post.offset(rand(Post.count)).limit(5)
  end

  def dashboard
    @user = current_user
    if user_signed_in?
      if @user.user_type == 'host'
        @approved_bookings = Booking.where(host_id:@user.id, status:'approved').count
        @pending_bookings = Booking.where(host_id:@user.id, status:'pending').count
      else @user.user_type == 'cleaner'
        @approved_bookings = Booking.where(cleaner_id:@user.id, status:'approved').count
        @pending_bookings = Booking.where(cleaner_id:@user.id, status:'pending').count
      end
    else
      return
    end
  end

  def user_table
    if current_user.user_type == 'host'
      @users = User.where(:user_type => 'cleaner')
    else
      @users = User.where(:user_type=>'host')
    end
  end

end
