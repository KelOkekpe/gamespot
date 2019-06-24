class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def bio
    @user = User.find params[:test]
  end

  def post

  end

end
