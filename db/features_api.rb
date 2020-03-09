require 'json'
require 'open-uri'
require 'csv'
require 'byebug'

  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/features.csv')

  url = 'https://api.teleport.org/api/urban_areas/'
  user_serialized = open(url).read
  cities = JSON.parse(user_serialized)

  CSV.open(filepath, 'ab', csv_options) do |csv|

    csv << ['city_name', 'cost_of_living_score', 'internet_score', 'culture_score', 'bread_price', 'cappucino_price', 'beer_price', 'lunch_price', 'taxi_price', 'spoken_languages', 'download_speed', 'upload_speed', 'air_quality', 'cleanliness', 'water_score', 'safety', 'coworking_score', 'health_score', 'art_score', 'concert_score', 'site_score', 'museum_score', 'sport_score']

    urban_areas_link = cities["_links"]["ua:item"].each do |city|

    # city continent and country
    city_url = city["href"]
    city_serialized = open(city_url).read
    city_info = JSON.parse(city_serialized)
    # Cost of living with new link "https://api.teleport.org/api/urban_areas/slug:amsterdam/scores/"
    cost_living = city_info["_links"]["ua:scores"]["href"]
    cost_living_serialized = open(cost_living).read
    cost = JSON.parse(cost_living_serialized)
    cost_of_living = cost["categories"][1]["score_out_of_10"]
    culture_score = cost["categories"][14]["score_out_of_10"]
    internet_score = cost["categories"][13]["score_out_of_10"]

    # FEATURES : Details with a new URL https://api.teleport.org/api/urban_areas/slug:amsterdam/details/
    details_url = city_info["_links"]["ua:details"]["href"]
    details_serialized = open(details_url).read
    city_details = JSON.parse(details_serialized)

    #COST _OF LIVING - features
    city_living_details = city_details["categories"].select { |data| data["id"] == "COST-OF-LIVING"}
  if city_living_details.empty?
  else
    # Bread price
    bread = city_living_details[0]["data"].select {|element| element["id"] == "COST-BREAD"}[0]
    bread_price = bread["currency_dollar_value"]

    #Price Cappucino
    cappucino = city_living_details[0]["data"].select {|element| element["id"] == "COST-CAPPUCCINO"}[0]
    cappucino_price = cappucino["currency_dollar_value"]

    #Price Beer
    beer = city_living_details[0]["data"].select {|element| element["id"] == "COST-IMPORT-BEER"}[0]
    beer_price = beer["currency_dollar_value"]

    #Price Lunch
    lunch = city_living_details[0]["data"].select {|element| element["id"] == "COST-RESTAURANT-MEAL"}[0]
    lunch_price = lunch["currency_dollar_value"]

    #Price Taxi
    taxi = city_living_details[0]["data"].select {|element| element["id"] == "COST-TAXI"}[0]

       if taxi.class == Hash
        taxi_price = taxi["currency_dollar_value"]
      else
        taxi_price = nil
      end
  end

    #LANGUAGES SPEAKING
  city_languages_details = city_details["categories"].select { |data| data["id"] == "LANGUAGE"}

  if city_languages_details.empty?
  else
    spoken_language = city_languages_details[0]["data"].select {|element| element["id"] == "SPOKEN-LANGUAGES"}[0]
    #if spoken_language == Hash
      languages = spoken_language["string_value"]
    #else
    #  languages = nil
    #end
  end

  #Internet Access_Download
  city_download_details = city_details["categories"].select { |data| data["id"] == "NETWORK"}
  if city_download_details.empty?
  else
    download = city_download_details[0]["data"].select {|element| element["id"] == "NETWORK-DOWNLOAD"}[0]
    #if download == Hash
        download_speed = download["float_value"]
    #else
     # download_speed = nil
    #end

      #Internet Access_Upload
    upload = city_download_details[0]["data"].select {|element| element["id"] == "NETWORK-UPLOAD"}[0]
   # if upload == Hash
      upload_speed = upload["float_value"]
   # else
   #   upload_speed = nil
   # end
  end

    #Air Quality
  city_air_details = city_details["categories"].select { |data| data["id"] == "POLLUTION"}
  if city_air_details.empty?
  else

    air = city_air_details[0]["data"].select {|element| element["id"] == "AIR-POLLUTION-TELESCORE"}[0]
    air_score = air["float_value"]

      #Cleanliness
    clean = city_air_details[0]["data"].select {|element| element["id"] == "CLEANLINESS-TELESCORE"}[0]
    clean_score = clean["float_value"]

      #Drinking water quality
    water = city_air_details[0]["data"].select {|element| element["id"] == "DRINKING-WATER-QUALITY-TELESCORE"}[0]
    #if water == Hash
      water_score = water["float_value"]
    #else
     # water_score = nil
    #end
  end

    # Safety score
  city_safety_details = city_details["categories"].select { |data| data["id"] == "SAFETY"}
  if city_safety_details.empty?
  else
  crime = city_safety_details[0]["data"].select {|element| element["id"] == "CRIME-RATE-TELESCORE"}[0]
  safety = crime["float_value"]
  end

    #Coworking score
  city_space_details = city_details["categories"].select { |data| data["id"] == "STARTUPS"}
  if city_space_details.empty?
  else
  coworking = city_space_details[0]["data"].select {|element| element["id"] == "COWORKING-SPACES-TELESCORE"}[0]
  coworking_score = coworking["float_value"]
  end

    # #Heathlcare quality score
  city_care_details = city_details["categories"].select { |data| data["id"] == "HEALTHCARE"}
  if city_care_details.empty?
  else
  health = city_care_details[0]["data"].select {|element| element["id"] == "HEALTHCARE-QUALITY-TELESCORE"}[0]
  health_score = health["float_value"]
  end

  #CULTURE
  city_culture_details = city_details["categories"].select { |data| data["id"] == "CULTURE"}
  if city_culture_details.empty?
  else
  #Culture Art galleries  score
  art = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-ART-GALLERIES-TELESCORE"}[0]
  art_score = art["float_value"]

  #Culture Concerts score
  concert = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-CONCERTS-TELESCORE"}[0]
  concert_score = concert["float_value"]

  #Culture historical sites score
  site = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-HISTORICAL-SITES-TELESCORE"}[0]
  site_score = site["float_value"]

  #Culture museum score
  museum = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-MUSEUMS-TELESCORE"}[0]
  museum_score = museum["float_value"]

  #Culture sports score
  sport = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-SPORTS-TELESCORE"}[0]
  sport_score = sport["float_value"]
  end



    puts city["name"]
    csv << [city["name"], cost_of_living, internet_score, culture_score, bread_price, cappucino_price, beer_price, lunch_price, taxi_price, languages, download_speed, upload_speed, air_score, clean_score, water_score, safety, coworking_score, art_score, concert_score, site_score, museum_score, sport_score]

    end
  end
