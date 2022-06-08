class Mutations::User::RegisterUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true
  argument :username, String, required: true

  field :token, String, null: true
  field :user, Types::UserType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(**kwargs)
    result = register_user(kwargs)
    result.success? ? result : execution_error(message: result.error)
  end

  def register_user(params)
    Users::Register.call(user_params: params)
  end
end
