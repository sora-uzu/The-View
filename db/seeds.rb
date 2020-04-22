Faker::Config.locale = :en
20.times do |n|
    name  = Faker::Name.name
    email = "sample#{n+1}@sample.com"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
  end