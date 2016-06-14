class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.new
    @reservations = Reservation.active
  end

  def create
    @reservation = Reservation.create(reservations_params)
    redirect_to root_path
  end

  private

    def reservations_params
      params.require(:reservation).permit(:name, :time)
    end
end
