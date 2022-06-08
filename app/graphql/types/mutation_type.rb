module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::User::CreateUser
    field :create_board, mutation: Mutations::Board::CreateBoard
    field :create_task, mutation: Mutations::Task::CreateTask
    field :destroy_user, mutation: Mutations::User::DestroyUser
  end
end
