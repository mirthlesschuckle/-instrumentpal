class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @reservations = current_user.reservations
    @instruments = current_user.instruments
  end

  def rent_instruments
    @reservations = current_user.reservations
  end

  def own_instruments
    @instruments = current_user.instruments
  end


end
