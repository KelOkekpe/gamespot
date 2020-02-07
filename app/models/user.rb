class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :host_bookings, :class_name => 'Booking', :foreign_key => 'host_id'
  has_many :cleaner_bookings, :class_name => 'Booking', :foreign_key => 'cleaner_id'
  has_many :units, :class_name => 'Unit', :foreign_key => 'owner_id'

  TYPES=[
    ['host','Host'],
    ['cleaner','Cleaner']
  ]


end
