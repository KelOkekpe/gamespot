namespace :bookings do
  desc "Mark booking complete after Time.current exceeds booking.starts_at date"
    task :mark_bookings_complete => :environment do
        Booking.where("starts_at < ?", Time.current).where(status:'approved').update_all(status:'completed')
        puts "bookings status have been updated"
      end
end
