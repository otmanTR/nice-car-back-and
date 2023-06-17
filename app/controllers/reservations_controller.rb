class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  
  def index
    list_reservations = Reservation.includes(car: [:images])
      .where(user_id: current_user_id).as_json(include: { car: { only: %i[ name description price ], include: :images } })

    render json: {
      data: {
        reservations: list_reservations
      }
    }, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params.merge(user_id: current_user_id))

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
    reservation = Reservation.find_by(id: params[:id], user_id: current_user_id)

    if reservation&.destroy
      render json: {
        operation: "reservation with id #{reservation.id} is deleted"
      }, status: :accepted
    else
      render json: {
        operation: "Couldn't delete reservation with id #{params[:id]}.",
        data: {
          errors: {
            reservation: 'not found'
          }
        }
      }, status: :not_found
    end
  end

  private

  def reservation_params
    params.permit(:start_date, :car_id, :end_date, :city)
  end
end
