class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.active
  end
end
