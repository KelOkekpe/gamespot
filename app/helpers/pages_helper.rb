module PagesHelper

  def trial_card_partial_path
    @user = current_user
    if @user.trial_paused
       'pages/dashboard/cards/trial_paused'
     else
       'pages/dashboard/cards/trial'
     end
   end

end
