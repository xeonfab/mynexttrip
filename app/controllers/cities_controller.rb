class CitiesController < ApplicationController

  def index
    @cities = City.all
    @countries = Country.all

    @cities = City.geocoded

    @markers = @cities.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { city: city })
        # image_url: helpers.asset_url('')
      }
    end
  end



  def show
    @city = City.find(params[:id])

    @markers = [{
      lat: @city.latitude,
      lng: @city.longitude
    }]
  end

  private

  def city_params
    params.require(:city).permit(:name, :location)
  end

end
