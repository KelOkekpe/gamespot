def seed_users
  created_at = Time.current
  user_id = 1
  5.times do |user|
    user = User.create(
      name: "cleaner user#{user_id}",
      email: "cleaner#{user_id}@test.com",
      password: 'password',
      password_confirmation: 'password',
      trial_end_date: created_at + 7.days,
      user_type: 'cleaner'
    )
    user.save! #this isnt necessary but its good for surfacing errors on failed vailidations
    user_id = user_id + 1
  end
  # puts "finished creating cleaner users!"

  5.times do |user|
    user = User.create(
      name: "host user#{user_id}",
      email: "host#{user_id}@test.com",
      password: 'password',
      password_confirmation: 'password',
      trial_end_date: created_at + 7.days,
      user_type: 'host'
    )
    user.save!
    user_id = user_id + 1
  end
  # puts "finished creating host users!"
end

def seed_bookings(starts_at)
  10.times do |booking|
    booking = Booking.create(
      notes: Faker::Movies::StarWars.quote,
      host_id: rand(6..10),
      cleaner_id: rand(1..5),
      status: ['pending', 'approved','denied','cancelled'].sample,
      starts_at: rand_time(30.days.ago)
    )
    booking.save!
  end
  # puts "finished creating bookings!"
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end


seed_users
seed_bookings(rand_time(30.days.ago))
