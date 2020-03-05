class BookingProvidersController < ApplicationController
  def index
    @bookingproviders = BookingProvider.all
  end

  def show
    @bookingprovider = BookingProvider.find(params[:id])
  end

end


# in here there will have to be in if else statement to display booking partners depending on whether the user is looking at a country or a city
