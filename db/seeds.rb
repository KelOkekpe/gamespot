def seed_users
  user_id = 0
  10.times do
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
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

  categories.each do |category|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0],
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
