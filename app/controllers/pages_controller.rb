class PagesController < ApplicationController
  def style_guide
  end

  def home

      @cities = City.all
      @countries = Country.all
      @regions = Region

    if params[:query].present?
      # make the index filtered by those params
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
    end
  end
end
