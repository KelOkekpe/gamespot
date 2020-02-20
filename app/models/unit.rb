class Unit < ApplicationRecord
    belongs_to :owner, :class_name => 'User'

    has_many :bookings, :class_name => 'Booking', :foreign_key => 'unit_id'

end
