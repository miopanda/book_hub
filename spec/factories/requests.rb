FactoryBot.define do
  factory :request do
    request_type_id     {Faker::Number.between(from: 2, to: 4)}
    message             {Faker::Lorem.sentence}
    resolved            {0}
    association :user
  end
end
