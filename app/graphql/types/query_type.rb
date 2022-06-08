class Types::QueryType < Types::BaseObject
  field :users, resolver: Queries::User::GetUsers
  field :user, resolver: Queries::User::GetUser
  field :boards, resolver: Queries::Boards
  field :board, resolver: Queries::Board
  field :tasks, resolver: Queries::Tasks
  field :task, resolver: Queries::Task
end
