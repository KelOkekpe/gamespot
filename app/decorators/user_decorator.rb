class UserDecorator < SimpleDelegator

  def days_left
    if state == 'paused'
      days_left = 'Trial Paused'
    elsif state == 'suspended'
      days_left = 'Account Suspended'
    elsif state == 'active'
      days_left = 'Account Active'
    elsif state == 'trial' && trial_end_date > Date.current
      days_left = (trial_end_date - Time.current) / 86400
      days_left += 1
      days_left.to_i
    else state == 'trial' && trial_end_date < Date.current
      days_left = '0'
    end
  end
end
