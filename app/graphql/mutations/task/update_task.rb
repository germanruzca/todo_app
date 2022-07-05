class Mutations::Task::UpdateTask < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :title, String, required: false
  argument :status, Integer, required: true

  field :success, Boolean, null: false
  field :task, Types::TaskType, null: true
  field :errors, [String], null: true

  def resolve(id:, **kwargs)
    task = Task.find(id)
    return { success: false } if Board.find(task.board_id).user_id != context[:current_user].id

    if task.update(kwargs)
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
