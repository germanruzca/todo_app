FactoryBot.define do
  factory :task do
    title {"This is the title of the task"}
    body { "This is the body of the task"}
    board
  end
end