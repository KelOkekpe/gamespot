class Booking < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'


end
