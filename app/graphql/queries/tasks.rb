module Queries
  class Tasks < BaseQuery
    description "Returns all task"

    type [Types::TaskType], null: false

    def resolve
      ::Task.all
    end
  end
end
