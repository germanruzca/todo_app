class Queries::User::GetUsers < Queries::BaseQuery
  description 'Get all users'

  type [Types::UserType], null: false

  def resolve
    ::User.all
  end
end
