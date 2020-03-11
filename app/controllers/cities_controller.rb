class CitiesController < ApplicationController

  def index
    # raise

    @cities = City.geocoded
    if params[:query].present?
      search_by_nav(params[:query])
    elsif params[:feature_results].present?
      search_by_query
      respond_to do |format|
        format.html { redirect_to cities_path }
        format.js
      end
    elsif params[:filter_results].present?
      search_by_theme_filter
    # elsif
    #   search_by_feature_filter
    raise
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
    @cities = City.with_scores(filter_params.to_h)
    country_ids = @cities.pluck(:country_id)
    @countries = Country.where(id: country_ids)
  end

  def search_by_theme_filter
    # journey/home page search
    @cities = City.initial_search(params[:filter_results])
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

    def search_by_feature_filter(user_feature_filtered_list)
    end

    def air_polution_score(air_polution_score)
      #case score

    end
end
