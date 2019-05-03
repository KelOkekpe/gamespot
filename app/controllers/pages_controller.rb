class PagesController < ApplicationController


  def index
  end

  def homepage
    @posts = Post.limit(8)
  end

  def dashboard

  end

  def extend_trial
    @user = current_user
    @user.update(trial_end_date: Date.today + 20.days)


      flash[:success] = "Trial successfully updated"
      redirect_to dashboard_path


  end



  def main_feed
    @posts = Post.limit(16)
  end

  def new_post

  end

end
