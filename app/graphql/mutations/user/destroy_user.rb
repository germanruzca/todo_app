class Mutations::User::DestroyUser < Mutations::BaseMutation
  description 'Destroy the User'

  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve
    current_user = context[:current_user]
    user = User.find(current_user.id)

    if user.destroy
      {
       success: true,
       errors: []
      }
    else
      {
       success: false,
       errors: user.errors.full_messages
      }
    end
  end
end
