class Mutations::CreateTask < Mutations::BaseMutation
  argument :title, String, required: true
  argument :body, String, required: true
  argument :status, Integer, required: true
  argument :board_id, Integer, required: true


  field :task, Types::TaskType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(**kwargs)
    task = Task.new(kwargs)
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