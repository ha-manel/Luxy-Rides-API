require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  before :all do
    @user = User.create(email: 'testing@test.com', name: 'Testing', username: 'testing')
    @car = Car.create(model: 'BMW', picture: 'picture link', driver_name: 'test', price: 250, user_id: @user.id)
  end

  describe 'POST create' do
    it 'returns status 201 (created)' do
      post :create, params: { user_id: @user.id, model: 'BMW', picture: 'picture link', driver_name: 'test', price: 250}
      expect(response.status).to eq(201)
    end

    it 'returns status 500 (internal_server_error) ' do
      post :create, params: { user_id: @user.id, model: 'BMW', picture: 'picture link', driver_name: 'test', price: -250}
      expect(response.status).to eq(500)
    end
  end

end
