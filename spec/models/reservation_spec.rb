require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @user = User.create(email: 'test@test.com', name: 'Test', username: 'test')
    @car = Car.create(model: 'BMW', picture: 'picture link', driver_name: 'test', price: 250, user_id: @user.id)
    @reservation = Reservation.new(user_id: @user.id, car_id: @car.id, date: '2022-09-04', city: 'test')
  end

  it 'is valid' do
    expect(@reservation).to be_valid
  end

  it 'date should be present' do
    @reservation.date = nil
    expect(@reservation).to_not be_valid
  end

  it 'city should be present' do
    @reservation.city = nil
    expect(@reservation).to_not be_valid
  end
end
