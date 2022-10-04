class CarsController < ApplicationController
  def index
    render json: { cars: Car.all }, status: :ok
  end

  def show
    @car = Car.find(params[:id])
    render json: { car: @car }, status: :ok
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: { success: 'The car has been created successfully.' }, status: :created
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  def delete
    @car = Car.find(params[:id])
    if @car.destroy!
      render json: { success: 'The car has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  def reserve
    @reserved_cars = Reservation.where(date: params[:date]).distinct.pluck(:car_id)
    @cars = Car.all
    @cars = @cars.reject { |car| @reserved_cars.include?(car.id) } unless @reserved_cars.empty?
    render json: { cars: @cars }, status: :ok
  end

  def user_cars
    @cars = User.find(params[:user_id]).cars
    render json: { cars: @cars }, status: :ok
  end

  private

  def car_params
    params.permit(:user_id, :model, :picture, :driver_name, :price)
  end
end
