class UsersController < ApplicationController

  def index
    if current_user.user_type == 'host'
      @users = User.where(:user_type => 'cleaner')
    else
      @users = User.where(:user_type=>'host')
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
