class ReservationsController < ApplicationController
  def create
    @reserved_cars = Reservation.where(date: params[:date]).distinct.pluck(:car_id)
    if @reserved_cars.include? params[:car_id].to_i
      render json: { error: 'This car is reserved on this date, please choose another date.' }, status: :not_acceptable
    else
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: { success: 'The reservation has been created successfully.' }, status: :created
      else
        render json: { error: 'There was an error, please try again.' }, status: :internal_server_error
      end
    end
  end

  def index
    @reservations = User.find(params[:user_id]).reservations
    @result = []
    @reservations.each do |res|
      @result << { reservation: res, car: Car.find(res.car_id) }
    end
    render json: { reservations: @result }, status: :ok
  end

  private

  def reservation_params
    params.permit(:user_id, :car_id, :city, :date)
  end
end
