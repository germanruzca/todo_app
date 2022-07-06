class Mutations::Board::UpdateBoard < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: true
  argument :description, String, required: true

  field :success, Boolean, null: false
  field :board, Types::BoardType, null: true
  field :errors, [String], null: true

  def resolve(id:, **kwargs)
    board = Board.find(id)
    return { success: false } if board.user_id != context[:current_user].id

    if board.update(kwargs)
      {
       board: board,
       success: true,
       errors: []
      }
    else
      {
       board: nil,
       success: false,
       errors: task.errors.full_messages
      }
    end
  end
end