require_relative '../types/register_user_type'

class Mutations::RegisterUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :username, String, required: true

  type Types::Payloads::RegisterUserType

  def resolve(**kwargs)
    user = User.new(kwargs)
    if user.save
      {
        success: true,
        user: user,
        errors: []
      }
    else
      {
        success: false,
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end