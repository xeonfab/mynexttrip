City.all.each do |city|

  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = File.join(__dir__, 'data/city.csv')

  CSV.open(filepath, 'ab', csv_options) do |csv|

    csv << ['name', 'location', 'country', 'latitude', 'longitude']
    csv << [city.name,]

    # ...
  end

  unless city.name.include?('-') || city.name.include?('Area')
    p url_weather = "https://api.openweathermap.org/data/2.5/weather?q=#{ city.name.include?(',') ? city.name.downcase.gsub(' ', "%") : city.name.downcase.gsub(' ', "%20")}&appid=ec7e53d090ba26a48cffe7b676e88bc5"
    weather_serialized = open(url_weather).read
    climate_weather = JSON.parse(weather_serialized)






end
end


   name: city_name,
    location: city_name,
    country: Country.find_by(name: country_name),
    latitude: latitude_name,
    longitude: longitude_name
