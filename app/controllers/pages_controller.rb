class PagesController < ApplicationController

  def index
  end

  def homepage
     #this shows 5 random posts
    @posts = Post.offset(rand(Post.count)).limit(5)
  end

  def dashboard
    @user = current_user
    @total_bookings = Booking.where(cleaner_id:@user.id).count
    @pending_bookings = Booking.where(cleaner_id:@user.id, status:'pending').count
  end


  #Trial Card Controllers #########
  def extend_trial
    @user = current_user
    update = @user.update(trial_end_date: Date.today + 20.days)

    flash[:alert] = "Trial Extended"
    redirect_to dashboard_path

  end

  def pause_trial
    @user = current_user
    @user.update(trial_end_date: nil, trial_paused: true, state:'paused')

    flash[:success] = "Trial Paused"
    redirect_to dashboard_path
  end

  def unpause_trial
    @user = current_user
    @user.update(trial_end_date:Date.today + 14.days, trial_paused: false, state:'trial')

    flash[:success] = "Trial Unpaused"
    redirect_to dashboard_path
  end

  def activate
    @user = current_user
    @user.update(state:'active')

    flash[:success] = "Account Reactivated"
    redirect_to dashboard_path
  end

  def suspend
    @user = current_user
    @user.update(trial_paused:nil, state:'suspended')


    flash[:success] = "Account Successfully Suspended"
    redirect_to dashboard_path
  end


  ########################

  def user_table
    @users = User.where(:user_type => 'cleaner')
  end

  def user_details

  end

  def main_feed
    @posts = Post.limit(16)
  end

  def new_post

  end

end
