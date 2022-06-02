module Queries
  class Tasks < BaseQuery
    description "Returns all tasks"

    type [Types::TaskType], null: false

    def resolve
      ::Task.all
    end
  end
end