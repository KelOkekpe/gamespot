json.extract! @booking, :id, :starts_at
json.start @booking.starts_at
json.end @booking.starts_at + 1.hour
json.url booking_url(@booking, format: :html)
