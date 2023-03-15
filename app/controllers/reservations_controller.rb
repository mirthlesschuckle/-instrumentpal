class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  # def show
  #   @reservation = Reservation.find(params[:id])
  # end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @reservation = current_user.reservations.new(instrument: @instrument)
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.instrument = @instrument
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation was successfully created.'
    else
      redirect_to instruments_path(@instrument), status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
