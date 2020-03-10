require 'json'
require 'open-uri'
require 'csv'

  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/city.csv')

  url = 'https://api.teleport.org/api/urban_areas/'
  user_serialized = open(url).read
  cities = JSON.parse(user_serialized)

  CSV.open(filepath, 'ab', csv_options) do |csv|

    csv << ['city_name', 'city_url', 'location', 'country_name', 'region_name', 'latitude', 'longitude', 'cost_of_living', 'internet_score', 'culture_score', ]

    urban_areas_link = cities["_links"]["ua:item"].each do |city|
      # city continent and country
      city_url = city["href"]
      city_serialized = open(city_url).read
      city_info = JSON.parse(city_serialized)

      region_name = city_info["_links"]["ua:continent"]["name"]
      country_name = city_info["_links"]["ua:countries"][0]["name"]

      # City Location with a new URL https://api.teleport.org/api/cities/geonameid:2759794/
      more_info_url = city_info["_links"]["ua:identifying-city"]["href"]
      more_info_serialized = open(more_info_url).read
      city_location = JSON.parse(more_info_serialized)

      # Cost of living with new link "https://api.teleport.org/api/urban_areas/slug:amsterdam/scores/"
      cost_living = city_info["_links"]["ua:scores"]["href"]
      cost_living_serialized = open(cost_living).read
      cost = JSON.parse(cost_living_serialized)

      cost_of_living = cost["categories"][1]["score_out_of_10"]*10
      culture_score = cost["categories"][14]["score_out_of_10"]*10
      internet_score = cost["categories"][13]["score_out_of_10"]*10
      puts city["name"]

       #city location
      latitude_name = city_location["location"]["latlon"]["latitude"]
      longitude_name = city_location["location"]["latlon"]["longitude"]

      # FEATURES : Details with a new URL https://api.teleport.org/api/urban_areas/slug:amsterdam/details/
      details_url = city_info["_links"]["ua:details"]["href"]
      details_serialized = open(details_url).read
      city_details = JSON.parse(details_serialized)

      csv << [city["name"], city["href"], city["name"], country_name, region_name, city_location["location"]["latlon"]["latitude"], city_location["location"]["latlon"]["longitude"], cost_of_living, internet_score, culture_score]

    end
  end

  # unless city.name.include?('-') || city.name.include?('Area')
  #   p url_weather = "https://api.openweathermap.org/data/2.5/weather?q=#{ city.name.include?(',') ? city.name.downcase.gsub(' ', "%") : city.name.downcase.gsub(' ', "%20")}&appid=ec7e53d090ba26a48cffe7b676e88bc5"
  #   weather_serialized = open(url_weather).read
  #   climate_weather = JSON.parse(weather_serialized)



