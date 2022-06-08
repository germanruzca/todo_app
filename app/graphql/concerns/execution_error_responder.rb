module ExecutionErrorResponder
  extend ActiveSupport::Concern

  private

  def execution_error(message: 1, status: :unprocessable_entity, code: 422)
    GraphQL::ExecutionError.new(message, options: {status: status, code: code})
  end
end