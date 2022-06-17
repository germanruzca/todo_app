module Queries
  class Tasks < BaseQuery
    description "Returns all task"

    argument :board_id, ID, required: true

    type [Types::TaskType], null: false

    def resolve(board_id:)
      ::Task.where(board_id: board_id)
    end
  end
end
