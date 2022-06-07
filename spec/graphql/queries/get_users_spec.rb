module Queries
  class User
    RSpec.describe 'GetUser', type: :request do
      describe '.resolve' do
        it 'should returns an user' do
          user = create(:user)
          post '/graphql', params: { query:  query(user.id)}
          json = JSON.parse(response.body)
          data = json['data']

          expect(data).to include('user' => {'firstName'=> user.first_name})
        end
      end

      def query(user_id)
        <<-GRAPHQL
          query {
            user(id: #{user_id}) {
              firstName
            }
          }
        GRAPHQL
      end
    end
  end

  class Users
    RSpec.describe 'GetUsers', type: :request do
      describe '.resolve' do
        it 'should returns all users' do
          user_1, user_2, user_3 = create_list(:user, 3)
          post '/graphql', params: { query:  query}
          json = JSON.parse(response.body)
          data = json['data']

          expect(data).to include('users' => [{ 'firstName' => user_1.first_name },{ 'firstName' => user_2.first_name },{ 'firstName' => user_3.first_name }])
        end
      end

      def query
        <<-GRAPHQL
          query {
            users {
              firstName
            }
          }
        GRAPHQL
      end
    end
  end
end
