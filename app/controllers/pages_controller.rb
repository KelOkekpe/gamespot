class PagesController < ApplicationController


  def index
  end

  def homepage
    @posts = Post.offset(rand(Post.count)).limit(4) #this shows 4 random posts
  end

  def dashboard

  end


  #Trial Card Controllers########
  def extend_trial
    @user = current_user
    @user.update(trial_end_date: Date.today + 20.days)

    flash[:success] = "Trial successfully updated"
    redirect_to dashboard_path
  end

  def pause_trial
    @user = current_user
    @user.update(trial_end_date: nil, trial_paused: true)

    flash[:success] = "Trial successfully updated"
    redirect_to dashboard_path
  end

  def unpause_trial
    @user = current_user
    @user.update(trial_end_date:Date.today + 14.days, trial_paused: false)

    flash[:success] = "Trial successfully updated"
    redirect_to dashboard_path
  end
  ########################

  def user_table
    @users = User.where(:trial_paused => false)
    
  end



  def main_feed
    @posts = Post.limit(16)
  end

  def new_post

  end

end
