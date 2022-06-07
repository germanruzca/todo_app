module Mutations
  module Users
    RSpec.describe "RegisteNewUser", type: :request do
      describe '.resolver' do
        it 'should regist an user' do
          user = build(:user)
          post '/graphql', params: { query: query(user)}
          json = JSON.parse(response.body)
          puts json
          data = json['data']['registerUser']
          expect(data).to include({ 'success' => true })
        end
      end

      def query(user)
        <<-GRAPHQL
          mutation {
            registerUser(input: {
                          firstName: #{user.first_name},
                          lastName: #{user.last_name},
                          email: #{user.email},
                          password: #{user.password},
                          passwordConfirmation: #{user.password_confirmation},
                          username: #{user.username}
                         }) {
              success,
              errors
            }
          }
        GRAPHQL
      end
    end
  end
end
