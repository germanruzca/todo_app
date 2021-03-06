class Mutations::Task::DestroyTask < Mutations::BaseMutation
  argument :id, ID, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(id:)
    task = Task.find(id)
    return { success: false } if Board.find(task.board_id).user_id != context[:current_user].id

    if task.destroy
      {
       task: task,
       success: true,
       errors: []
      }
    else
      {
       task: nil,
       success: false,
       errors: task.errors.full_messages
      }
    end

  end
end