class PagesController < ApplicationController
  def style_guide
  end

  def home
    @cities = City.all
    @countries = Country.all
    @regions = Region.all
  end

end
