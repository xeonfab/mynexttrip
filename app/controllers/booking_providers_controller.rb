class BookingProvidersController < ApplicationController
  def index
    @bookingproviders = BookingProvider.all
    # @country = Country.find(params[:country_id])
    # @city = City.find(params[:city_id]) if !params[:city_id].nil?

    if !params[:city_id].nil?
      @booking_place = City.find(params[:city_id])
    else
      @booking_place = Country.find(params[:country_id])
    end

  end

  def show
    @bookingprovider = BookingProvider.find(params[:id])
  end

end


# in here there will have to be in if else statement to display booking partners depending on whether the user is looking at a country or a city
