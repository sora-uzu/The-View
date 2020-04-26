FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    image { open("#{Rails.root}/app/assets/images/no_image.jpg") }
    user
    latitude { 0 }
    longitude { 0 }
    trait :invalid do
      title nil
    end
  end
end
