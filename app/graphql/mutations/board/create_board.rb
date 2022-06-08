class Mutations::Board::CreateBoard < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: false
  argument :user_id, ID, required: true


  field :board, Types::BoardType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(**kwargs)
    board = Board.new(kwargs)
    if board.save
      {
        success: true,
        board: board,
        errors: []
      }
    else
      {
        success: false,
        board: nil,
        errors: board.errors.full_messages
      }
    end
  end
end
