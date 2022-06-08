module Queries
  class Board < Queries::BaseQuery
    description 'Get a board'

    argument :id, ID, required: true

    type Types::BoardType, null: false

    def resolve(id:)
      ::Board.find(id)
    end
  end
end
