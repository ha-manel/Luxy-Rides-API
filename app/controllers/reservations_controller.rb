class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { success: 'The reservation has been created successfully' }
    else
      render json: { error: 'There was an error, please try again!' }
    end
  end

  def index
    @user = User.find(params[:user_id])
    render json: { reservations: @user.reservations }
  end

  private

  def reservation_params
    params.permit(:user_id, :car_id, :city, :date)
  end
end
