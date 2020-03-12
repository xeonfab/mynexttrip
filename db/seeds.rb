require 'json'
require 'open-uri'
require 'byebug'
require 'date'
require 'csv'

puts 'Cleaning database...'
CityFeature.destroy_all
Feature.destroy_all
CityTheme.destroy_all
Theme.destroy_all



Climate.destroy_all

BookingProvider.destroy_all
City.destroy_all



Country.destroy_all
Region.destroy_all



puts "Making the Regions"

europe = Region.create!(
  name: "Europe",
  )

file7 = URI.open('https://images.unsplash.com/photo-1542379950-b3fc716c16f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
europe.photo.attach(io: file7, filename: 'Europe1.jpeg', content_type: 'image/jpeg')

north_america = Region.create!(
  name: "North America",
  )

file = URI.open('https://images.unsplash.com/photo-1501861481341-4496c34620bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1525&q=80')
north_america.photo.attach(io: file, filename: 'North_America1.jpeg', content_type: 'image/jpeg')

south_america = Region.create!(
  name: "South America",
  )

file1 = URI.open('https://images.unsplash.com/photo-1529476488885-3159d45ab78b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
south_america.photo.attach(io: file1, filename: 'South_America1.jpeg', content_type: 'image/jpeg')

africa = Region.create!(
  name: "Africa",
  )

file2 = URI.open('https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1566&q=80')
africa.photo.attach(io: file2, filename: 'Africa1.jpeg', content_type: 'image/jpeg')

asia = Region.create!(
  name: "Asia",
  )

file3 = URI.open('https://images.unsplash.com/photo-1441839438427-ad31d742a202?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1647&q=80')
asia.photo.attach(io: file3, filename: 'Asia1.jpeg', content_type: 'image/jpeg')

the_middle_east = Region.create!(
  name: "The Middle East",
  )

file4 = URI.open('https://images.unsplash.com/photo-1570206913724-17f67ed3a6d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80')
the_middle_east.photo.attach(io: file4, filename: 'MiddleEast1.jpeg', content_type: 'image/jpeg')

australia_and_pacific = Region.create!(
  name: "Oceania",
  )

file5 = URI.open('https://images.unsplash.com/photo-1528163308254-5852067f0a1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
australia_and_pacific.photo.attach(io: file5, filename: 'AustraliaP1.jpeg', content_type: 'image/jpeg')

central_america = Region.create!(
  name: "Central America",
  )

file6 = URI.open('https://images.unsplash.com/photo-1518638150340-f706e86654de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1648&q=80')
central_america.photo.attach(io: file6, filename: 'CentralAmerica1.jpeg', content_type: 'image/jpeg')




# Creating all the features used in CityFeatures (because it is a join table)

puts " Creating features"

bread_feature = Feature.create!(
  name: "Bread",
  weight: 80
  )

cappucino_feature = Feature.create!(
  name: "Cappucino",
  weight: 80
  )

beer_feature = Feature.create!(
  name: "Beer",
  weight: 80
  )
lunch_feature = Feature.create!(
  name: "Lunch",
  weight: 80
  )

taxi_feature = Feature.create!(
  name: "Taxi ride",
  weight: 80
  )

language_feature = Feature.create!(
  name: "Spoken languages",
  weight: 80
  )

download_feature = Feature.create!(
  name: "Internet download",
  weight: 80
  )

upload_feature = Feature.create!(
  name: "Internet upload",
  weight: 80
  )

air_feature = Feature.create!(
  name: "Air pollution",
  weight: 80
  )

cleanliness_feature = Feature.create!(
  name: "Cleanliness",
  weight: 80
  )

water_feature = Feature.create!(
  name: "Drinking water",
  weight: 80
  )

crime_feature = Feature.create!(
  name: "Crime rate",
  weight: 80
  )

coworking_feature = Feature.create!(
  name: "Coworking spaces",
  weight: 80
  )

healthcare_feature = Feature.create!(
  name: "Healthcare",
  weight: 80
  )


art_feature = Feature.create!(
  name: "Art Galleries",
  weight: 80
  )

site_feature = Feature.create!(
  name: "Historical sites",
  weight: 80
  )

concert_feature = Feature.create!(
  name: "Concerts",
  weight: 80
  )

museum_feature = Feature.create!(
  name: "Museums",
  weight: 80
  )

sport_feature = Feature.create!(
  name: "Sports",
  weight: 80
  )

cost_living_feature = Feature.create!(
  name: "Cost of living",
  weight: 80
  )

culture_feature = Feature.create!(
  name: "Culture",
  weight: 80
  )

internet_feature = Feature.create!(
  name: "Internet",
  weight: 80
  )

# ---------------------------------------------------



puts "Making the Countries"

# # cities list with name and url for teleport API
# url = 'https://api.teleport.org/api/urban_areas/'
# user_serialized = open(url).read
# cities = JSON.parse(user_serialized)

# #loop for each cities in teleport API
# urban_areas_link = cities["_links"]["ua:item"].each do |city|
#   puts "--------------------------------------"

  # # city name
  # city_name = city["name"]
  # puts city["name"]
  # #if the city already created, go next city item
  # next if City.find_by(name: city_name)
  # # --------------------------

  # # city continent and country
  # city_url = city["href"]
  # city_serialized = open(city_url).read
  # city_info = JSON.parse(city_serialized)
  # region_name = city_info["_links"]["ua:continent"]["name"]
  # country_name = city_info["_links"]["ua:countries"][0]["name"]
  # puts region_name
  # puts country_name
  # # --------------------------

  #   # Cost of living with new link "https://api.teleport.org/api/urban_areas/slug:amsterdam/scores/"
  # cost_living = city_info["_links"]["ua:scores"]["href"]
  # cost_living_serialized = open(cost_living).read
  # cost = JSON.parse(cost_living_serialized)

  # cost_of_living = cost["categories"][1]["score_out_of_10"]
  # puts cost_of_living
  # culture_score = cost["categories"][14]["score_out_of_10"]
  # puts culture_score
  # internet_score = cost["categories"][13]["score_out_of_10"]
  # puts internet_score


  # # City Location with a new URL https://api.teleport.org/api/cities/geonameid:2759794/
  # more_info_url = city_info["_links"]["ua:identifying-city"]["href"]
  # more_info_serialized = open(more_info_url).read
  # city_location = JSON.parse(more_info_serialized)

  # #city location
  # latitude_name = city_location["location"]["latlon"]["latitude"]
  # longitude_name = city_location["location"]["latlon"]["longitude"]



  puts "--------------------------------------"


  csv_options = { headers: :first_row, header_converters: :symbol }
  filepath = File.join(__dir__, 'data/city.csv')

  CSV.foreach(filepath, csv_options) do |row|

    # CREATE COUNTRY
    if Country.find_by(name: row[:country_name]).nil?
      new_country = Country.create!(
        name: row[:country_name],
        region: Region.find_by(name: row[:region_name]),
        photo: "https://source.unsplash.com/700x400/?#{row[:country_name]},landscape"
        )
      p new_country

        # photo_country = URI.open("https://source.unsplash.com/700x400/?#{row[:country_name]},landscape")
        # #new_country.photo.key = [TAKE FROM CSV KEY]
        # new_country.photos.attach(io: photo_country, filename: "#{row[:country_name]}.jpeg", content_type: 'image/jpeg')
    end

    #puts "#{new_country.name} created!"


    # CREATE CITY
    next if City.find_by(name: row[:city_name])
      new_city = City.create!(
      name: row[:city_name],
      location:row[:location],
      country: Country.find_by(name: row[:country_name]),
      latitude: row[:latitude],
      longitude: row[:longitude],
      photo: "https://source.unsplash.com/700x400/?#{row[:city_name]},landscape"
      )

      # photo = URI.open("https://source.unsplash.com/700x400/?#{row[:city_name]},landscape")
      #new_city.photos.attach(io: photo, filename: "#{row[:city_name]}.jpeg", content_type: 'image/jpeg')
       puts "#{new_city.name} created!"
    end


   # FEATURES : Details with a new URL https://api.teleport.org/api/urban_areas/slug:amsterdam/details/
  # details_url = city_info["_links"]["ua:details"]["href"]
  # details_serialized = open(details_url).read
  # city_details = JSON.parse(details_serialized)

  # Select all data for each feature


  #LANGUAGES
  # csv_options = { headers: :first_row, header_converters: :symbol }
  # filepath = File.join(__dir__, 'data/languages.csv')


  #   CSV.foreach(filepath, csv_options) do |row|

  #   #Languages speaking
  #   CityFeature.create!(
  #   score: row[:spoken_languages],
  #   feature: language_feature,
  #   city: City.find_by(name: row[:city_name])
  #   )

  #   end


  #COST OF LIVING
  csv_options = { headers: :first_row, header_converters: :symbol }
  filepath = File.join(__dir__, 'data/features.csv')


    CSV.foreach(filepath, csv_options) do |row|

      CityFeature.create!(
        score: row[:cost_of_living_score]*100,
        feature: cost_living_feature,
        city: City.find_by(name: row[:city_name])
      )
      puts "cost of living score feature created"


    #Bread price
      CityFeature.create!(
        score: row[:bread_price],
        # Link to the features table
        feature: bread_feature,
        city: City.find_by(name: row[:city_name])
      )

    #Price Cappucino
      CityFeature.create!(
      score: row[:cappucino_price],
      # Link to the features table
      feature: cappucino_feature,
      city: City.find_by(name: row[:city_name])
      )

    #Price Beer
      CityFeature.create!(
      score: row[:beer_price],
      feature: beer_feature,
      city: City.find_by(name: row[:city_name])
      )

    #Price Lunch
      CityFeature.create!(
      score: row[:lunch_price],
      feature: lunch_feature,
      city: City.find_by(name: row[:city_name])
      )

    #  #Price Taxi
      CityFeature.create!(
      score: row[:taxi_price],
      feature: taxi_feature,
      city: City.find_by(name: row[:city_name])
      )

    #Internet score
    CityFeature.create!(
        score: row[:internet_score],
        feature: internet_feature,
        city: City.find_by(name: row[:city_name])
      )
    puts "Internet score feature created"

  #Internet Access_Download
    CityFeature.create!(
    score: row[:download_speed],
    feature: download_feature,
    city: City.find_by(name: row[:city_name])
    )

  #Internet Access_Upload
    CityFeature.create!(
    score: row[:upload_speed],
    feature: upload_feature,
    city: City.find_by(name: row[:city_name])
    )


  #Air Quality
  CityFeature.create!(
  score: row[:air_quality],
  feature: air_feature,
  city: City.find_by(name: row[:city_name])
  )


  #Cleanliness
  CityFeature.create!(
  score: row[:cleanliness],
  feature: cleanliness_feature,
  city: City.find_by(name: row[:city_name])
  )

  # #Drinking water quality
      CityFeature.create!(
      score: row[:water_score],
      feature: water_feature,
      city: City.find_by(name: row[:city_name])
      )

  #safety score
  CityFeature.create!(
  score: row[:safety],
  feature: crime_feature,
  city: City.find_by(name: row[:city_name])
  )

  #Coworking score
  CityFeature.create!(
  score: row[:coworking_score],
  feature: coworking_feature,
  city: City.find_by(name: row[:city_name])
  )

  # #Heathlcare quality score
  CityFeature.create!(
  score: row[:health_score],
  feature: healthcare_feature,
  city: City.find_by(name: row[:city_name])
  )

  # Create the Culture score
  CityFeature.create!(
        score: row[:culture_score],
        feature: culture_feature,
        city: City.find_by(name: row[:city_name])
      )
  puts "Culture score feature created - #{row[:city_name]}"

  #Culture Art galleries  score
  CityFeature.create!(
  score: row[:art_score],
  feature: art_feature,
  city: City.find_by(name: row[:city_name])
  )

  #Culture Concerts score
  CityFeature.create!(
  score: row[:concert_score],
  feature: concert_feature,
  city: City.find_by(name: row[:city_name])
  )

  #Culture historical sites score
  CityFeature.create!(
  score: row[:site_score],
  feature: site_feature,
  city: City.find_by(name: row[:city_name])
  )

  #Culture museum score
  CityFeature.create!(
  score: row[:museum_score],
  feature: museum_feature,
  city: City.find_by(name: row[:city_name])
  )

  #Culture sports score
  CityFeature.create!(
  score: row[:sport_score],
  feature: sport_feature,
  city: City.find_by(name: row[:city_name])
  )
end


puts "Making Climates"
  csv_options = { headers: :first_row, header_converters: :symbol }
  filepath = File.join(__dir__, 'data/weather.csv')


    CSV.foreach(filepath, csv_options) do |row|
      climate = Climate.create!(
      january: row[:january],
      february: row[:february],
      march: row[:march],
      april: row[:april],
      may: row[:may],
      june: row[:june],
      july: row[:july],
      august: row[:august],
      september: row[:september],
      october: row[:october],
      november: row[:november],
      december: row[:december],
      city: City.find_by(name: row[:name])
    )
    puts "#{climate.city.name} weather climate created"
  end


puts "Making the Themes"

romantic = Theme.create!(
  name: "Romantic")

city = Theme.create!(
  name: "City")

beach = Theme.create!(
  name: "Beach")

culture = Theme.create!(
  name: "Culture")

mountains = Theme.create!(
  name: "Mountains")

shopping = Theme.create!(
  name: "Shopping")

luxury = Theme.create!(
  name: "Luxury")

countryside = Theme.create!(
  name: "Countryside")


puts "Making City_Themes"

City.all.each do |city|

  if city.country.name === "New Zealand"
      CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "New zealand themes created"

  elsif city.country.name === "Indonesia"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Indonesia themes created"

  elsif city.country.name === "Thailand"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Thailand themes created"

      elsif city.country.name === "Nepal"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Nepal themes created"

  elsif city.country.name === "Australia"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Australia themes created"

elsif city.country.name === "Vietnam"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Vietnam themes created"

    elsif city.country.name === "Japan"
      CityTheme.create!(
      january: 1,
      february: 1,
      march: 1,
      april: 1,
      may: 1,
      june: 0,
      july: 0,
      august: 0,
      september: 0,
      october: 0,
      november: 1,
      december: 1,
      theme: Theme.find_by(name: 'Countryside'),
      city: city
      )
      CityTheme.create!(
      january: 1,
      february: 1,
      march: 1,
      april: 1,
      may: 1,
      june: 0,
      july: 0,
      august: 0,
      september: 0,
      october: 0,
      november: 1,
      december: 1,
      theme: Theme.find_by(name: 'Mountains'),
      city: city
      )

      CityTheme.create!(
      january: 1,
      february: 1,
      march: 1,
      april: 1,
      may: 1,
      june: 0,
      july: 0,
      august: 0,
      september: 0,
      october: 0,
      november: 1,
      december: 1,
      theme: Theme.find_by(name: 'Culture'),
      city: city
      )
      puts "Japan themes created"

  elsif city.country.name === "Cambodia"
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Countryside'),
    city: city
    )
    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Mountains'),
    city: city
    )

    CityTheme.create!(
    january: 1,
    february: 1,
    march: 1,
    april: 1,
    may: 1,
    june: 0,
    july: 0,
    august: 0,
    september: 0,
    october: 0,
    november: 1,
    december: 1,
    theme: Theme.find_by(name: 'Culture'),
    city: city
    )
      puts "Cambodia themes created"

  else

  CityTheme.create!(
    january: rand(0..1),
    february: rand(0..1),
    march: rand(0..1),
    april: rand(0..1),
    may: rand(0..1),
    june: rand(0..1),
    july: rand(0..1),
    august: rand(0..1),
    september: rand(0..1),
    october: rand(0..1),
    november: rand(0..1),
    december: rand(0..1),
    theme: Theme.all.sample,
    city: city)
    puts "Other theme created"
  end
end

puts "Making the Booking Providers"

csv_options = { headers: :first_row, header_converters: :symbol }
#filepath = 'data/booking_providers.csv'
filepath = File.join(__dir__, 'data/booking_providers.csv')

CSV.foreach(filepath, csv_options) do |row|

  BookingProvider.create!(
  name: row[:name],
  category: row[:category],
  website: row[:url],
  description: row[:description],
  city: City.find_by(name: row[:city]),
  country: Country.find_by(name: row[:country])
  )
end


cities_without = City.includes(:climate).where(climates: {id: nil})

cities_without.each do |city|
Climate.create!(
      january: 20,
      february: 15,
      march: 10,
      april: 10,
      may: 10,
      june: 10,
      july: 25,
      august: 25,
      september: 15,
      october: 15,
      november: 10,
      december: 10,
      city: city
    )
end
