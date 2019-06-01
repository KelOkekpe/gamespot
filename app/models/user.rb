class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  def days_left
    if state == 'paused'
      days_left = 'Trial Paused'
    elsif state == 'suspended'
      days_left = 'Account Suspended'
    elsif state == 'active'
      days_left = 'Account Active'
    else state == 'trial'
      days_left = (trial_end_date - Time.current) / 86400
      days_left += 1
      days_left.to_i
    end

  end



end
