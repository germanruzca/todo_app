FactoryBot.define do
  factory :board do
    name { "This is the name of the board"}
    description { "This is the description of the board"}
    user
  end
end