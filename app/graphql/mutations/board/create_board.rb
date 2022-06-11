class Mutations::Board::CreateBoard < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: false


  field :board, Types::BoardType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(**kwargs)
    board = Board.new(kwargs)
    current_user = context[:current_user]
    puts current_user
    board.user_id = current_user.id

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
