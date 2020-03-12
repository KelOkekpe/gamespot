json.array!(@bookings) do |booking|
  json.extract! booking, :id, :starts_at, :cleaner_id, :status
  json.status booking.status
  json.start booking.starts_at
  json.end booking.starts_at + 1.hour
  json.title booking.cleaner.name + ' cleaning'
  json.url booking_url(booking, format: :html)
end
