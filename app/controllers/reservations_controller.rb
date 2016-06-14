class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.new
    @reservations = Reservation.active
  end

  def create
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      redirect_to root_path, notice: "Your table has been reserved."
    else
      @reservations = Reservation.active
      if @reservation.errors.full_messages.include?("Capacity Max capacity reached")
        flash.now[:alert] = "Sorry, our tables are full at that time."
      end
      render :index
    end
  end

  private

    def reservations_params
      params.require(:reservation).permit(:name, :time)
    end
end
