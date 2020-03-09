class CitiesController < ApplicationController

  def index
    @cities = City.geocoded

    if params[:query].present?
      search_by_query
    elsif params[:filter_results].present?
      search_by_theme_filter(params[:filter_results][:themes])
    # elsif
    #   search_by_feature_filter
    else
      no_search
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

  def search_by_query
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
  end

  def search_by_theme_filter(user_theme_filtered_list)
    user_theme_filtered_list.delete("")
      user_month = params[:filter_results][:month]
      if user_theme_filtered_list.present? && user_month.present?
        city_themes_with_month = []
        user_theme_filtered_list.each do |filtered_theme|
          # theme = Theme.global_search(filtered_theme)
          # city_themes = CityTheme.where(theme: theme)
          city_themes_pg = CityTheme.global_search(filtered_theme)
          city_themes_with_month << city_themes_pg.where(user_month.downcase.to_sym => 1)
        end

        @cities = city_themes_with_month.map { |city_theme| city_theme.first.city } if !city_themes_with_month.first.empty?
        city_themes_with_month.first.empty? ? @countries = Country.all : @countries = @cities.map { |city| city.country }
        # the line above this should ideally throw an error message as well as showing all the city and countries to tell the user that their filters yeilded no results
      else
        no_search
      end
  end

    def no_search
      @cities = City.all
      @countries = Country.all
    end

    def city_params
      params.require(:city).permit(:name, :photo)
    end

    def search_by_feature_filter(user_feature_filtered_list)
    end

    def air_polution_score(air_polution_score)
      case score
      when (0..0.19)
        "very_bad"
      when (0.20..0.39)
        "bad"
      when (0.40..1)
        "average"
      when (0.60..1)
        "good"
      when (0.80..1)
        "very_good"
    end
end


