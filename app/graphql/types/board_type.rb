# frozen_string_literal: true

module Types
  class BoardType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tasks, [Types::TaskType], null: false
    field :tasks_count, Integer, null: false

    def tasks_count
      object.tasks.count
    end
  end
end
