module UsersHelper

  def host
    current_user.user_type == 'host'
  end

  def cleaner
    current_user.user_type == 'cleaner'
  end

end
