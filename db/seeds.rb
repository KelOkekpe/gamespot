def seed_users
  created_at = Time.current
  user_id = 1
  5.times do |user|
    user = User.create(
      name: Faker::Sports::Basketball.player,
      email: "cleaner#{user_id}@test.com",
      password: 'password',
      password_confirmation: 'password',
      trial_end_date: created_at + 7.days,
      user_type: 'cleaner'
    )
    user.save! #this isnt necessary but its good for surfacing errors on failed vailidations
    puts "seeding user #{user_id}"
    user_id = user_id + 1
  end
  puts "finished creating cleaner users!"

  5.times do |user|
    user = User.create(
      name: Faker::TvShows::FamilyGuy.character,
      email: "host#{user_id}@test.com",
      password: 'password',
      password_confirmation: 'password',
      trial_end_date: created_at + 7.days,
      user_type: 'host'
    )
    user.save!
    puts "seeding user #{user_id}"
    user_id = user_id + 1
    puts "seeding user #{user_id}"
  end
  puts "finished creating host users!"
end


def seed_units
  number = 1
  20.times do |unit|
    unit = Unit.create(
      name: Faker::Cannabis.strain,
      owner_id: rand(1..10),
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip_code: Faker::Address.zip_code
    )
    puts "seeding unit #{number}"
    unit.save!
    number+=1
  end
  puts "finished seeding units!"
end


# def seed_bookings(starts_at)
#   number = 1
#   20.times do |booking|
#     booking = Booking.create(
#       notes: Faker::Movies::StarWars.quote,
#       host_id: rand(6..10),
#       cleaner_id: rand(1..5),
#       unit_id: rand(1..20),
#       status: ['pending', 'approved','denied','cancelled'].sample,
#       starts_at: rand_time(30.days.ago),
#       price: rand(40..100).to_int,
#       requested_by_id: rand(1..5)
#     )
#     puts "seeding booking #{number}"
#     booking.save!
#     number+=1
#   end
#   puts "finished seeding cleaner requested bookings"
# end


def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end


seed_users
seed_units
# seed_bookings(rand_time(30.days.ago))
