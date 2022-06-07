require 'rails_helper'

module Mutations
  module Users
    RSpec.describe 'DestroyUser', type: :request do
      describe '.resolver' do
        it 'should remove the user' do
          user = create(:user)

          expect do
            post '/graphql', params: { query: query(user.id)}
          end.to change { User.count }.by(-1)
        end
      end

      def query(user_id)
        <<-GRAPHQL
          mutation{
            destroyUser(input: {id: #{user_id}}) {
              success
            }
          }
        GRAPHQL
      end
    end
  end
end
