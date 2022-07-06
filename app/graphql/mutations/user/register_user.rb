class Mutations::User::RegisterUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true
  argument :username, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false
  field :token, String, null: true

  def resolve(**kwargs)
    user = User.new(kwargs)
    user.email = user.email.downcase

    if user.save
      token = JwtHelper.encode_token({user: user.email, user_id: user.id})
      {
        success: true,
        user: user,
        token: token,
        errors: []
      }
    else
      {
        success: false,
        user: nil,
        token: token,
        errors: user.errors.full_messages
      }
    end
  end
end