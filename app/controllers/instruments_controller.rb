class InstrumentsController < ApplicationController
  def index
    start_date = Date.today
    end_date = Date.today + 1.month # or any other desired end_date
    @instruments = available_instruments(start_date, end_date)
  end

  def available_instruments(start_date, end_date)
    reserved_instruments = Reservation.where("start_date < ? AND end_date > ?", end_date, start_date).pluck(:instrument_id)
    Instrument.where.not(id: reserved_instruments)
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

  private

  def instrument_params
    params.require(:instrument).permit(:location, :model, :price, :photo)
  end
end
