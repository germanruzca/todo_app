module Queries
  class Boards < Queries::BaseQuery
    description 'Get all boards'

    type [Types::BoardType], null: false

    def resolve
      ::Board.where(user_id: context[:current_user].id)
    end
  end
end
