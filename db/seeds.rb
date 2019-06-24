def seed_users
  created_at = Time.current
  user_id = 1
  5.times do
    User.create(
      name: "User#{user_id}",
      email: "User#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456',
      trial_end_date: created_at + 7.days,
      user_type: 'cleaner'
    )
    user_id = user_id + 1
  end
end


def seed_categories
  sports = ['NBA', 'NCAA', 'NFL', 'MLB', 'Futbol']
  games = ['Shooters', 'RPG', 'Strategy',
          'Fighters']
  music = ['Rap/Hip-Hop', 'R&B', 'Soul', 'Alternative']

  sports.each do |name|
    Category.create(branch: 'sports', name: name)
  end

  games.each do |name|
    Category.create(branch: 'games', name: name)
  end

  music.each do |name|
    Category.create(branch: 'music', name: name)
  end
end


def seed_posts
  categories = Category.all
  branch =

  categories.each do |category|
    5.times do
      Post.create(
        title: "Category: #{category.branch}",
        content: Faker::Lorem.sentences[0],
        user_id: rand(1..9),
        category_id: category.id
      )
    end
  end


end

seed_users
seed_categories
seed_posts
