require 'open-uri'
require 'JSON'
require 'csv'

City.all.each do |city|

  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/weather.csv')

  CSV.open(filepath, 'ab', csv_options) do |csv|

    csv << ['name', 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    csv << [city.name, climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"], climate_weather["main"]["temp"]]

    # ...
  end

  unless city.name.include?('-') || city.name.include?('Area')
    p url_weather = "https://api.openweathermap.org/data/2.5/weather?q=#{ city.name.include?(',') ? city.name.downcase.gsub(' ', "%") : city.name.downcase.gsub(' ', "%20")}&appid=ec7e53d090ba26a48cffe7b676e88bc5"
    weather_serialized = open(url_weather).read
    climate_weather = JSON.parse(weather_serialized)






end
end
