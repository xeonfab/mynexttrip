class PagesController < ApplicationController
  def style_guide
  end

  def home
      country_array = ['Australia', 'Spain', 'France', 'Canada', 'New Zealand', 'Mexico', 'United Kingdom', 'Brazil']
      @countries = country_array.map {|country| Country.find_by(name: country)}

      city_array = ['Brisbane', 'Atlanta', 'Athens', 'Dubai', 'Edinburgh', 'Barcelona', 'Bali', 'Beijing']
      @cities = city_array.map {|city| City.find_by(name: city)}
      @regions = Region.all

    if params[:query].present?
      # make the index filtered by those params
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
    end
  end

  def onboarding

  end
end
