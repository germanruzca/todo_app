module Types
  module Payloads
    class RegisterUserType < Types::BaseObject
      field :token, String, null: false
      field :user, Types::UserType, null: true
      field :success, Boolean, null: false
      field :errors, [String], null: false
    end
  end
end