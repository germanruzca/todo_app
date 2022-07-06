module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::User::CreateUser
    field :create_board, mutation: Mutations::Board::CreateBoard
    field :update_board, mutation: Mutations::Board::UpdateBoard
    field :destroy_board, mutation: Mutations::Board::DestroyBoard
    field :create_task, mutation: Mutations::Task::CreateTask
    field :destroy_task, mutation: Mutations::Task::DestroyTask
    field :update_task, mutation: Mutations::Task::UpdateTask
    field :destroy_user, mutation: Mutations::User::DestroyUser
    field :register_user, mutation: Mutations::User::RegisterUser
    field :login, mutation: Mutations::Auth::Login
  end
end
