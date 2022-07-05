class Mutations::Task::CreateTask < Mutations::BaseMutation
  argument :title, String, required: true
  argument :body, String, required: true
  argument :status, Integer, required: true
  argument :board_id, Integer, required: true


  field :task, Types::TaskType, null: true
  field :errors, [String], null: true
  field :success, Boolean, null: false

  def resolve(**kwargs)
    task = Task.new(kwargs)
    return { success: false } if Board.find(kwargs[:board_id]).user_id != context[:current_user].id

    if task.save
      {
        success: true,
        task: task,
        errors: []
      }
    else
      {
        success: false,
        task: nil,
        errors: task.errors.full_messages
      }
    end
  end
end
