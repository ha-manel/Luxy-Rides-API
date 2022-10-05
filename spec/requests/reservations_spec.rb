require 'swagger_helper'

RSpec.describe 'reservations', type: :request do

  path '/api/v1/reservation/{user_id}/{car_id}/{city}/{date}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'car_id', in: :path, type: :string, description: 'car_id'
    parameter name: 'city', in: :path, type: :string, description: 'city'
    parameter name: 'date', in: :path, type: :string, description: 'date'

    post('create reservation') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:car_id) { '123' }
        let(:city) { '123' }
        let(:date) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{user_id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list reservations') do
      response(200, 'successful') do
        let(:user_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
