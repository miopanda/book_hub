FactoryBot.define do
  factory :book do
    title             {Faker::Book.title}
    publisher         {Faker::Book.publisher}
    image_url         {Faker::Internet.url}
    association :user
  end
end
