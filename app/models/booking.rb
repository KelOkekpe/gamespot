class Booking < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :cleaner, :class_name => 'User'
  belongs_to :unit, :class_name => 'Unit'



  # extend TimeSplitter::Accessors
  # split_accessor :starts_at
  # split_accessor :ends_at

  def start_time
    self.starts_at
  end

  # def unit
  #   unit.name
  # end

  def total_earnings
    if current_user.user_type == 'cleaner'
      Booking.where(cleaner_id:current_user.id).to_a.sum {|b| b.price.to_int}
    elsif current_user.user_type == 'host'
      Booking.where(host_id: current_user.id).to_a.sum {|b| b.price.to_int}
    end
  end

end
