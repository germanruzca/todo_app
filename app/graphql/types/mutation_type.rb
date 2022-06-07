module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_board, mutation: Mutations::CreateBoard
    field :create_task, mutation: Mutations::CreateTask
    field :register_user, mutation: Mutations::RegisterUser
    field :destroy_user, mutation: Mutations::DestroyUser
  end
end
