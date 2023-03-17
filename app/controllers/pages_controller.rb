class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @reservations = current_user.reservations
    @instruments = current_user.instruments
  end

  def story
  end

  def own_instruments
    @instruments = current_user.instruments
  end

  def map_instruments
    @instruments = Instrument.all
    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude
      }
    end
  end
end
