class Booking < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'
  belongs_to :unit, :class_name => 'Unit'
  belongs_to :requested_by, :class_name => 'User'

  validates :price, :presence => true



  # extend TimeSplitter::Accessors
  # split_accessor :starts_at
  # split_accessor :ends_at

  def start_time
    self.starts_at
  end

  # def unit
  #   unit.name
  # end


end
