class Booking < ApplicationRecord
  extend ActiveModel::Callbacks

  before_create :generate_event_id

  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'
  belongs_to :unit, :class_name => 'Unit'
  belongs_to :requested_by, :class_name => 'User'

  validates :price, :presence => true

  def start_time
    self.starts_at
  end

  def pending_incoming_request
    booking.status=='pending' && current_user.user_type =='cleaner' && booking.requested_by_id != current_user.id
  end

  def approved_request
    booking.status=='approved'
  end

  private

   def generate_event_id
     self.event_id = SecureRandom.hex(10)
   end

end
