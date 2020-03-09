require 'open-uri'
require 'JSON'
require 'csv'

City.all.each do |city|

  unless city.name.include?('-') || city.name.include?('Area')

    p url_weather = "https://api.openweathermap.org/data/2.5/weather?q=#{ city.name.include?(',') ? city.name.downcase.gsub(' ', "%") : city.name.downcase.gsub(' ', "%20")}&appid=ec7e53d090ba26a48cffe7b676e88bc5"
    weather_serialized = open(url_weather).read
    climate_weather = JSON.parse(weather_serialized)

  # Puts "API url ok"

  #   Climate.create!(
  #     january: climate_weather["main"]["temp"],
  #     february: climate_weather["main"]["temp"],
  #     march: climate_weather["main"]["temp"],
  #     april: climate_weather["main"]["temp"],
  #     may: climate_weather["main"]["temp"],
  #     june: climate_weather["main"]["temp"],
  #     july: climate_weather["main"]["temp"],
  #     august: climate_weather["main"]["temp"],
  #     september: climate_weather["main"]["temp"],
  #     october: climate_weather["main"]["temp"],
  #     november: climate_weather["main"]["temp"],
  #     december: climate_weather["main"]["temp"],
  #     city: city
  #   )
  #   Puts "#{city} weather climate created"
  # end


  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/weather.csv')

  CSV.open(filepath, 'ab', csv_options) do |csv|

    csv << ['name', 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    csv << [city.name, climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"]]

    # ...
  end
end
end
