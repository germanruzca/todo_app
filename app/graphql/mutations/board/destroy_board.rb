class Mutations::Board::DestroyBoard < Mutations::BaseMutation
  argument :id, ID, required: true

  field :success, Boolean, null: false
  field :errors, [String], null: true
  field :board, Types::BoardType, null: true

  def resolve(id:)
    board = Board.find(id)

    return { success: false } if board.user_id != context[:current_user].id

    if board.destroy
      {
       success: true,
       board: board,
       errors: nil,
      }
    else
      {
       success: false,
       board: nil,
       errors: board.errors.full_messages,
      }
    end

  end
end