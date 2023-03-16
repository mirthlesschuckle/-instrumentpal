class InstrumentsController < ApplicationController
  def index
    @instruments = available_instruments
  end

  def available_instruments
    reserved_instruments_ids = Reservation.select(:instrument_id).distinct
    Instrument.where.not(id: reserved_instruments_ids)
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to instruments_path(@instrument)
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to instruments_path(@instrument)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:location, :model, :price, :photo)
  end
end
