class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :host_bookings, :class_name => 'Booking', :foreign_key => 'host_id'
  has_many :cleaner_bookings, :class_name => 'Booking', :foreign_key => 'cleaner_id'


end
