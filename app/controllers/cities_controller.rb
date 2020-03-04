class CitiesController < ApplicationController

  def index

    @cities = City.geocoded

    if params[:query].present?
      # make the index filtered by those params
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
    else
      @cities = City.all
      @countries = Country.all
    end

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
    params.require(:city).permit(:name)
  end

end
