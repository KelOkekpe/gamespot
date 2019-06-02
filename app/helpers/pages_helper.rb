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


end
