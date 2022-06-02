module Queries
  class Boards < Queries::BaseQuery
    description 'Get all boards'

    type [Types::BoardType], null: false

    def resolve
      ::Board.all
    end
  end
end