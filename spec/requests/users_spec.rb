require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/api/v1/register/{username}/{name}/{email}' do
    # You'll want to customize the parameter types...
    parameter name: 'username', in: :path, type: :string, description: 'username'
    parameter name: 'name', in: :path, type: :string, description: 'name'
    parameter name: 'email', in: :path, type: :string, description: 'email'

    post('register user') do
      response(200, 'successful') do
        let(:username) { '123' }
        let(:name) { '123' }
        let(:email) { '123' }

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

  path '/api/v1/login/{username}' do
    # You'll want to customize the parameter types...
    parameter name: 'username', in: :path, type: :string, description: 'username'

    get('login user') do
      response(200, 'successful') do
        let(:username) { '123' }

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
