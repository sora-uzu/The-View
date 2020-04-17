FactoryBot.define do
  factory :user do
    name {"name"}
    email {"hoge@example.com"}
    password {"password"}
    password_confirmation{"password"}
  end
end
