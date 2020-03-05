class CitiesController < ApplicationController

  def index

    @cities = City.geocoded
    raise

    if params[:query].present?
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]

    elsif params[:filter_results].present?
      params[:filter_results][:themes].delete("")

      if params[:filter_results][:themes].present?
        terms = params[:filter_results][:themes]
        city_themes_with_month = []
        terms.each do |term|
          theme = Theme.global_search(term)

          city_themes = CityTheme.where(theme: theme)
          city_themes_with_month << city_themes.where(params[:filter_results][:month].downcase.to_sym => 1)
        end

        (@cities = city_themes_with_month.map { |city_theme| city_theme.first.city}) if !city_themes_with_month.first.empty?
        @countries = Country.all
        # the line above this should ideally throw an error message as well as showing all the city and countries to tell the user that their filters yeilded no results

      end

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
