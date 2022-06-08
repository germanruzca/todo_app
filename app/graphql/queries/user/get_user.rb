class Queries::User::GetUser < Queries::BaseQuery
  description 'A user'

  argument :id, ID, required: true

  type Types::UserType, null: false

  def resolve(id:)
    ::User.find(id)
  end
end
