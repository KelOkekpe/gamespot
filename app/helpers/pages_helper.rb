module PagesHelper

  def trial_card_partial_path
    @user = current_user

    if @user.state == 'paused'
       'pages/dashboard/cards/trial_paused'
     elsif @user.state == 'suspended'
       'pages/dashboard/cards/suspended'
     elsif @user.state == 'trial'
       'pages/dashboard/cards/trial'
     else @user.state == 'active'
       'pages/dashboard/cards/active'
     end
   end

  def dashboard_helper_path
   @user = current_user
   if @user.user_type == 'host'
     render 'pages/dashboard/dashboard'
    elsif @user.user_type == 'cleaner'
      render 'pages/dashboard/cleaner_dashboard'
    end
  end

end
