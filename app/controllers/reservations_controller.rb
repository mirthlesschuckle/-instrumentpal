class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update]

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

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: 'Reservation was successfully updated.'
    else
      render :edit, notice: 'Nothing as been changed.'
    end
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
