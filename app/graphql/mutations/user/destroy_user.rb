class Mutations::User::DestroyUser < Mutations::BaseMutation
  description 'Destroy the User'
  argument :id, ID, required: true

  field :errors, [String], null: false
  field :success, Boolean, null: false

  def resolve(id:)
    user = User.find_by_id(id)
    puts User.count

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
