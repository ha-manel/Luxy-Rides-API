class CarsController < ApplicationController
  def index
    render json: { cars: Car.all }
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: { success: 'The car has been created successfully' }
    else
      render json: { error: 'There was an error, please try again!' }
    end
  end

  def delete
    @car = Car.find(params[:id])
    if @car.destroy!
      render json: { success: 'The car has been deleted successfully' }
    else
      render json: { error: 'There was an error, please try again!' }
    end
  end

  def reserve
    @reserved_cars = Reservation.where(date: params[:date]).distinct.pluck(:car_id)
    @cars = []
    if @reserved_cars.empty?
      @cars = Car.all
    else
      @reserved_cars.each do |car|
        @cars = Car.where.not(id: car)
      end
    end
    render json: { cars: @cars }
  end

  private

  def car_params
    params.permit(:user_id, :model, :picture, :driver_name)
  end
end
