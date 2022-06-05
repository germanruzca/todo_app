module Users
  class GenerateToken
    include Interactor

    delegate :user, to: :context
    delegate :id, to: :user, prefix: true

    def call
      context.token = generate_token
    end

    private

    def generate_token
      JWT.encode(payload, hmac_secret, hmca_algorithm)
      rescue StandardError => e
        context.fail!(message: e.message)
    end

    def payload
      {
        sub: user_id,
        jti: jwt_id,
        iat: issued_at,
        exp: expiration_time
      }
    end

    def hmac_secret
     'secreto'
    end

    def hmca_algorithm
      'HS256'
    end
  end
end