FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.name }
    password { "#{Faker::Alphanumeric.alphanumeric(number: 8)}" }
    email { "german@example#{Faker::Number.number}.com"}
  end
end