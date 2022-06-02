module Queries
  class Task < BaseQuery
    description 'Find a task by ID'

    argument :id, ID, required: true

    type Types::TaskType, null: false

    def resolve(id:)
      ::Task.find(id)
    end
  end
end