class Mutations::User::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

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
