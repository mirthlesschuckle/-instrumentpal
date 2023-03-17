class InstrumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

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
    redirect_to instruments_path(@instrument), alert: 'Instrument was successfully created.'
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

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def check_owner
    unless current_user == @instrument.user
      redirect_to instruments_path, alert: "You can only edit instruments you own."
    end
  end
end
