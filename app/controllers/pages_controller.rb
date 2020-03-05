class PagesController < ApplicationController
  def style_guide
  end

  def home

    if params[:query].present?
      # make the index filtered by those params
      @cities = City.global_search(params[:query])
      @countries = [@cities.first.country]
    else
      @cities = City.all
      @countries = Country.all
    end

  end

end
