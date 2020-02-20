class UsersController < ApplicationController

  def index
    if current_user.user_type == 'host'
      @users = User.where(:user_type => 'cleaner').paginate(:page => params[:page], :per_page => 5)
    else
      @users = User.where(:user_type=>'host').paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    @user = current_user
  end

  def bio
    @user = User.find params[:test]
  end

  def post

  end

end
