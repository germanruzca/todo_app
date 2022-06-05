require 'rails_helper'

module Mutations
  module Users
    describe 'CreateUser', type: :request do
      describe '.resolve' do
        it 'should creates a user' do
          expect do
            post '/graphql', params: { query: query}
          end.to change { User.count }.by(1)
        end


        it 'should return an user' do
          post '/graphql', params: { query: query}
          json = JSON.parse(response.body)
          data = json['data']['createUser']

          expect(data).to include(
            'success' => true,
            'user' => {
              'id' => User.last.id.to_s,
              'firstName' => User.last.first_name,
              'lastName' => User.last.last_name,
              'username' => User.last.username,
              'email' => User.last.email,
            }
          )
        end
      end

      def query
        <<~GQL
          mutation {
            createUser(input: {
              firstName: "Test User",
              lastName: "Test User",
              username: "testuser",
              password: "testuser",
              email: "test@test.com"
            }) {
              success,
              user {
                id,
                firstName,
                lastName,
                username,
                email
              }
            }
          }
        GQL
      end
    end
  end
end