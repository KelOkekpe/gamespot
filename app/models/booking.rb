class Booking < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'

  extend TimeSplitter::Accessors
  split_accessor :starts_at
  split_accessor :ends_at


end
