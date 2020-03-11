require 'json'
require 'open-uri'
require 'csv'

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/languages.csv')

  url = 'https://api.teleport.org/api/urban_areas/'
  user_serialized = open(url).read
  cities = JSON.parse(user_serialized)

  CSV.open(filepath, 'ab', csv_options) do |csv|

  csv << ['city_name', 'spoken_languages1', 'spoken_languages2', 'spoken_languages3', 'spoken_languages4', 'spoken_languages5', 'spoken_languages6', 'spoken_languages7', 'spoken_languages8']


  urban_areas_link = cities["_links"]["ua:item"].each do |city|
  # city continent and country
    city_url = city["href"]
    city_serialized = open(city_url).read
    city_info = JSON.parse(city_serialized)


    # FEATURES : Details with a new URL https://api.teleport.org/api/urban_areas/slug:amsterdam/details/
    details_url = city_info["_links"]["ua:details"]["href"]
    details_serialized = open(details_url).read
    city_details = JSON.parse(details_serialized)

  #LANGUAGES SPEAKING
  city_languages_details = city_details["categories"].select { |data| data["id"] == "LANGUAGE"}

  if city_languages_details.empty?
  else
    spoken_language = city_languages_details[0]["data"].select {|element| element["id"] == "SPOKEN-LANGUAGES"}[0]
    if spoken_language.class == Hash
      languages = spoken_language["string_value"]
    else
       languages = nil
    end
  end

  csv << [city["name"], languages]

  end
end
