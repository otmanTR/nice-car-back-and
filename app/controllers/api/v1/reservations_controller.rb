class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @reservations = Reservation.includes(:car).all
    @reservation_data = @reservations.map do |reservation|
      {
        image: reservation.car.image,
        id: reservation.id,
        city: reservation.city,
        start_date: reservation.start_date,
        end_date: reservation.end_date,
        name: reservation.car.name
      }
    end
    render json: @reservation_data
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: {
        operation: 'reservation created successfully',
        data: {
          reservation_id: reservation.id
        }
      }, status: :created
    else
      render json: {
        operation: 'not successful',
        data: {
          errors: reservation.errors
        }
      }, status: :bad_request
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'reservation deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :city, :car_id, :user_id)
  end
end
