class CitiesController < ApplicationController

  def index
    if params[:query].present?
      # make the index filtered by those params
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
    else
      @cities = City.all
      @countries = Country.all
    end
  end

  def show
    @city = City.find(params[:id])
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end

end
