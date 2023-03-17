class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update]
  before_action :set_reservation_for_update_status, only: [:update_status]

  def index
    @reservations = current_user.reservations
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @reservation = current_user.reservations.new(instrument: @instrument)
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.instrument = @instrument
    if @reservation.save
      redirect_to reservations_path, alert: 'Reservation was successfully created.'
    else
      redirect_to instruments_path(@instrument), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, alert: 'Reservation was successfully updated.'
    else
      render :edit, alert: 'Nothing as been changed.'
    end
  end

  def update_status
    if @reservation.update(status: params[:reservation][:status])
      redirect_to reservations_path, alert: 'Reservation was successfully updated.'
    else
      render :edit, alert: 'Nothing has been changed.'
    end
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def set_reservation_for_update_status
    instrument_ids = current_user.instruments.pluck(:id)
    @reservation = Reservation.where(instrument_id: instrument_ids).find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end
end
