require 'rails_helper'

module Mutationsz
  module Tasks
    RSpec.describe "CreateTask", type: :request do
      describe '.resolve' do
        it 'should create a task' do
          board = create(:board)
          expect do
            post '/graphql', params: { query: query(board.id) }
          end.to change { Task.count }.by(1)
        end

        it 'should returns a task' do
          board = create(:board)

          post '/graphql', params: { query: query(board.id)}
          json = JSON.parse(response.body)
          data = json['data']['createTask']

          expect(data).to include(
             'success' => true,
             'task' => {
                'id' => Task.last.id.to_s,
                'title' => Task.last.title,
                'body' => Task.last.body,
                'status' => Task.last.status
             }
          )
        end
      end

      def query(board_id)
        <<-GRAPHQL
          mutation {
            createTask(input: {
                title: "This is the title of my task",
                body: "Thos is the body of my task",
                status: 1
                boardId: #{board_id}
              }
            ) {
                success,
                task {
                  id,  
                  title,
                  body,
                  status
                }
            }
          }
        GRAPHQL
      end
    end
  end
end
