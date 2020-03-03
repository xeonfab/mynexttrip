class CitiesController < ApplicationController
   def index
    if params[:query].present?
      terms = params[:query].gsub(/\s+/m, ' ').strip.split(" ")
      @cities = []
      terms.each do |term|
        @cities << City.global_search(term).to_a
      end
      @cities = @cities.flatten
    else
      @cities = City.all
    end
    @markers = @cities.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { city: city })
      }
    end
  end
end
