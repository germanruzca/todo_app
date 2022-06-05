FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n|"German #{n}" }
    sequence(:last_name) { |n| "Ruiz #{n}" }
    sequence(:username) { |n| "germanruzca#{n}" }
    password {"12345678790"}
    sequence(:email) {|n| "german@example#{n}.com"}
  end
end