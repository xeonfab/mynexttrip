class CountriesController < ApplicationController
  def index
  @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
