require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST register' do
    it 'If the username is not exists in db returns status 201 (created)' do
      post :register,
           params: { name: 'Example', username: 'example', email: 'example@gmail.com' }
      expect(response.status).to eq(201)
    end

    it 'returns status 500 (internal_server_error) ' do
      post :register,
           params: { name: 'Test', username: ' ', email: 'test@gmail.com' }
      expect(response.status).to eq(500)
    end
  end
end
