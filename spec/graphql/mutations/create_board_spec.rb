require 'rails_helper'

module Mutations
  module Boards
    describe 'CreateBoard', type: :request do
      describe '.resolve' do
        it 'should creates a board' do
          user = create(:user)
          expect do
            post '/graphql', params: { query: query(user.id)}
          end.to change {Board.count}.by(1)
        end

        it 'should return a board' do
          user = create(:user)

          post '/graphql', params: { query: query(user.id)}
          json = JSON.parse(response.body)
          data = json['data']['createBoard']

          expect(data).to include(
             'success' => true,
             'board' => {
                'id' => Board.last.id.to_s,
                'name' => Board.last.name,
                'description' => Board.last.description
             }
          )
        end
      end

      def query(user_id)
        <<-GRAHPQL
        mutation {
          createBoard(
            input: {
              name: "New board",
              description: "This is the description"
              userId: #{user_id}
            }
          ) {
              success,
              board {
                id,
                name,
                description
              }
            }
        }
        GRAHPQL
      end
    end
  end
end
