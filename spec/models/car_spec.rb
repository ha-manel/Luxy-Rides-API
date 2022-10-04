require 'rails_helper'

RSpec.describe Car, type: :model do
  before :each do
    @user = User.create(name: 'Hammad', username: 'hammad', email: 'hammad@gmail.com')
    @car = Car.create(user_id: @user.id, model: 'Lamborgini', driver_name: 'Mark Dennis', price: 250, picture: 'https://images.unsplash.com/photo-1519245659620-e859806a8d3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')
  end

  context 'model validations' do

    it 'should be valid' do
      expect(@car).to be_valid
    end

    it 'should be invalid without no model name' do
      @car.model = nil
      expect(@car).to_not be_valid
    end

    it 'should be invalid without no driver name' do
      @car.driver_name = nil
      expect(@car).to_not be_valid
    end

    it 'should be invalid without no picture given' do
      @car.picture = nil
      expect(@car).to_not be_valid
    end
  end
end
