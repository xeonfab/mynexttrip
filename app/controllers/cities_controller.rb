class CitiesController < ApplicationController

  def index
    # raise

    # @cities = City.geocoded
    if params[:query].present?
      search_by_nav(params[:query])
      map_markers

    elsif params[:feature_results].present?
      search_by_query
      respond_to do |format|
        format.html { redirect_to cities_path }
        map_markers

        format.js
      end
    elsif params[:filter_results].present?
      search_by_theme_filter
      map_markers
    # elsif
    #   search_by_feature_filter
    else
      no_search
      map_markers
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

  def map_markers
    @markers = @cities.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { city: city }),
        # image_url: helpers.asset_url('')
        image_url: helpers.asset_url('bluemarker1.png')
      }
    end
  end

  def map_markers_ajax
    @markers
  end


  def search_by_nav(params_name)
    @cities = City.global_search(params_name)
    no_search if @cities.empty?
    @countries = [@cities.first.country]
  end


  def search_by_query
    # left side filter search
    # Keep the theme params
    # convert filter to look like [["cleanliness", 80], ["crime_rate", 60]]
    # use map
    city_ids = params[:feature_results][:city_ids].map(&:to_i)
    @cities = City.with_scores(filter_params.to_h).select { |city| city_ids.include?(city.id) }
    country_ids = @cities.pluck(:country_id)
    @countries = Country.where(id: country_ids)
  end

  def search_by_theme_filter
    # journey/home page search
    filters = params[:filter_results].permit!.to_h
    @cities = City.initial_search(filters)
    country_ids = @cities.pluck(:country_id)
    @countries = Country.where(id: country_ids)
    # no search result as well
  end

    def no_search
      @cities = City.all
      @countries = Country.all
    end

    #  <ActionController::Parameters {"utf8"=>"✓", "feature_results"=><ActionController::Parameters {"cost_of_living"=>"51", "air_quality"=>"51", "water_quality"=>"77", "cleanliness"=>"36", "safety"=>"51", "culture"=>"51", "internet_speed"=>"51", "languages"=>[""], "month"=>""} permitted: true>, "commit"=>"search", "controller"=>"cities", "action"=>"index"} permitted: true>
    def filter_params
      params.require(:feature_results).permit(:cost_of_living, :air_quality, :water_quality, :cleanliness, :safety , :culture , :internet_speed)
    end

    def theme_params
      params.require(:filter_results).permit(:themes, :temp, :months, :regions)
    end
end
