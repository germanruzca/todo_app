module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Queries::Users
    field :user, resolver: Queries::User
    field :boards, resolver: Queries::Boards
    field :board, resolver: Queries::Board
    field :tasks, resolver: Queries::Tasks
    field :task, resolver: Queries::Task
  end
end
