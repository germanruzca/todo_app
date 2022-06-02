# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :first_name, String
    field :last_name, String
    field :email, String
    field :password, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :boards_count, Integer, null: true
    field :boards, [Types::BoardType], null: true

    def boards_count
      object.boards.count
    end
  end
end
