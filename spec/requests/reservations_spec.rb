require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  before :all do
    @user = User.create(email: 'test@test.com', name: 'Test', username: 'test')
    @car = Car.create(model: 'BMW', picture: 'picture link', driver_name: 'test', price: 250, user_id: @user.id)
  end

  describe 'POST create' do
    it 'returns status 201' do
      post :create, params: { user_id: @user.id, car_id: @car.id, city: 'test', date: '2022-09-04' }
      expect(response.status).to eq(201)
    end

    it 'returns status 406' do
      post :create, params: { user_id: @user.id, car_id: @car.id, city: 'test', date: '2022-09-05' }
      post :create, params: { user_id: @user.id, car_id: @car.id, city: 'test', date: '2022-09-05' }
      expect(response.status).to eq(406)
    end
  end

  describe 'GET index' do
    it 'returns reservations array' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end
end
