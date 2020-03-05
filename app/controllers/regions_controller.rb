class RegionsController < ApplicationController
  def index
  @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
    @countries = @region.countries
    @cities = @region.cities
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
