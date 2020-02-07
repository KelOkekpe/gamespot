class Booking < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'

  has_one :unit, :class_name => 'Unit', :foreign_key => 'unit_id'

  # extend TimeSplitter::Accessors
  # split_accessor :starts_at
  # split_accessor :ends_at

  def start_time
    self.starts_at
  end


end
