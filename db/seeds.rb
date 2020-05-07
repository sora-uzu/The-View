Faker::Config.locale = :en

20.times do |n|
  name = Faker::FunnyName.name
  email = "sample#{n + 1}@sample.com"
  image = open("#{Rails.root}/db/sample/profile/profile-#{n + 1}.jpg")
  password = 'password'
  User.create!(name: name,
               email: email,
               image: image,
               password: password,
               password_confirmation: password)
end

users = User.order(created_at: 'DESC').take(20)

users.each.with_index(1) do |user, _n|
  1.upto(3) do |_n|
    title = Faker::Address.street_name
    description = Faker::Movie.quote
    image = open("#{Rails.root}/db/sample/scene/scene-#{rand(1..25)}.jpg")
    latitude = rand(10..60)
    longitude = rand(5..147)
    user.posts.create(
      title: title,
      description: description,
      image: image,
      latitude: latitude,
      longitude: longitude
    )
  end
end

# リレーションシップ
user = users.last
following = users[2..20]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# # いいね
posts = Post.order(:created_at)

0.upto(30) do |i|
  0.upto(10) do |n|
    posts[i].likes.create(user_id: users[n].id)
  end
end

# コメント
0.upto(30) do |i|
  0.upto(10) do |n|
    content = Faker::Lorem.sentence
    users[n].comments.create(post_id: posts[i].id, content: content)
  end
end
