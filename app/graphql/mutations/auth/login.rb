class Mutations::Auth::Login < Mutations::BaseMutation

  argument :email, String, required: true
  argument :password, String, required: true


  field :success, Boolean, null: false
  field :errors, [String], null: false
  field :message, String, null: false
  field :token, String, null: true

  def resolve(**kwargs)
    user = User.find_by(email: kwargs[:email].downcase)

    if user && user.authenticate(kwargs[:password])
      token = JwtHelper.encode_token({user: user.email, user_id: user.id})
      {
        success: true,
        message: "Login Successful",
        errors: [],
        token: token
      }
    else
      {
        success: false,
        message: "Login Failed",
        errors: ["Invalid Credentials"],
        token: nil
      }
    end
  end
end
