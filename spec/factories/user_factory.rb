FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { "germanruzca" }
    password {"12345678790"}
    email { "german@example#{Faker::Number.number}.com"}
  end
end