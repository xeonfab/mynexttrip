require 'json'
require 'open-uri'
require 'date'

puts 'Cleaning database...'
Feature.destroy_all
Theme.destroy_all

CityTheme.destroy_all
CityFeature.destroy_all
Climate.destroy_all

City.destroy_all
BookingProvider.destroy_all

Country.destroy_all
Region.destroy_all

puts "Making the Booking Providers"

wicked_campers = BookingProvider.create!(
  name: "Wicked Campers",
  website: "https://www.wickedcampers.ca/",
  description: "Looking for a campervan in Vancouver? Our campervan is the most flexible way to get around Canada and North America. Cheaper than a package tour or bus and hostels! With a giant bed, a sexy kitchen and a paintjob that would make Van Gogh cut off his other ear – Wicked Campers are the BEST way of cruising around America and Canada! Cheaper than an RV and sexier than your Dads new girlfriend – these vans are decked out with everything you need for a kickass roadtrip!",
  category: "Transport")

comptoir = BookingProvider.create!(
  name: "Conptoir",
  website: "https://www.comptoir.fr/",
  description: "Over 30 years of experience have enabled us to refine the list of ingredients essential to the success of an authentic and personalized trip. Follow the recipe!",
  category: "Travel Agency")

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

capuccino_feature = Feature.create!(
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
  name: "healtcare",
  weight: 80
  )

coworking_feature = Feature.create!(
  name: "Coworking spaces",
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



# ---------------------------------------------------



puts "Making the Countries"

# cities list with name and url for teleport API
url = 'https://api.teleport.org/api/urban_areas/'
user_serialized = open(url).read
cities = JSON.parse(user_serialized)

#Install API Google for photos of countries and cities
# url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Melbourne'
# places_serialized = open(url).read
# places = JSON.parse(places_serialized)

#loop for each cities in teleport API
urban_areas_link = cities["_links"]["ua:item"].each do |city|
  puts "--------------------------------------"

  # city name
  city_name = city["name"]
  puts city["name"]
  #if the city already created, go next city item
  next if City.find_by(name: city_name)
  # --------------------------

  # city continent and country
  city_url = city["href"]
  city_serialized = open(city_url).read
  city_info = JSON.parse(city_serialized)
  region_name = city_info["_links"]["ua:continent"]["name"]
  country_name = city_info["_links"]["ua:countries"][0]["name"]
  puts region_name
  puts country_name
  # --------------------------

  # City Location with a new URL https://api.teleport.org/api/cities/geonameid:2759794/
  more_info_url = city_info["_links"]["ua:identifying-city"]["href"]
  more_info_serialized = open(more_info_url).read
  city_location = JSON.parse(more_info_serialized)

  #city location
  latitude_name = city_location["location"]["latlon"]["latitude"]
  longitude_name = city_location["location"]["latlon"]["longitude"]


  puts "--------------------------------------"

  # create the country table
  if Country.find_by(name: country_name).nil?
    new_country = Country.create!(
      name: country_name,
      region: Region.find_by(name: region_name)
      )
      photo_country = URI.open("https://source.unsplash.com/1024x700/?#{country_name},landscape")
      new_country.photos.attach(io: photo_country, filename: "#{country_name}.jpeg", content_type: 'image/jpeg')
  end

  # Create the city table
  new_city = City.create!(
    name: city_name,
    location: city_name,
    country: Country.find_by(name: country_name),
    latitude: latitude_name,
    longitude: longitude_name
    )

  photo_city = URI.open("https://source.unsplash.com/1024x700/?#{city_name},landscape")
  #photo = URI.open("https://source.unsplash.com/random?#{city_name}")
  new_city.photos.attach(io: photo_city, filename: "#{city_name}.jpeg", content_type: 'image/jpeg')

  puts "#{new_city.name} created!"



  #Population
  puts city_location["population"]


   # FEATURES : Details with a new URL https://api.teleport.org/api/urban_areas/slug:amsterdam/details/
  details_url = city_info["_links"]["ua:details"]["href"]
  details_serialized = open(details_url).read
  city_details = JSON.parse(details_serialized)

  # Select all data for each feature

  #COST OF LIVING
  city_living_details = city_details["categories"].select { |data| data["id"] == "COST-OF-LIVING"}
  if city_living_details.empty?
  else
    # Bread price
    bread = city_living_details[0]["data"].select {|element| element["id"] == "COST-BREAD"}[0]
    if bread == []
      CityFeature.create!(
        score: bread["currency_dollar_value"],
        # Link to the features table
        feature: bread_feature,
        city: new_city
      )
      #puts bread["label"]
      #puts bread["currency_dollar_value"]
    else
    end

    # #Price Cappucino
    cappucino = city_living_details[0]["data"].select {|element| element["id"] == "COST-CAPPUCCINO"}[0]
    if cappucino == []
      CityFeature.create!(
      score: cappucino["currency_dollar_value"],
      # Link to the features table
      feature: cappucino_feature,
      city: new_city
      )
    #puts cappucino["label"]
    #puts cappucino["currency_dollar_value"]
    else
    end

    # #Price Beer
    beer = city_living_details[0]["data"].select {|element| element["id"] == "COST-IMPORT-BEER"}[0]
    if beer == []
      CityFeature.create!(
      score: beer["currency_dollar_value"],
      feature: beer_feature,
      city: new_city

      )
    #puts beer["label"]
    #puts beer["currency_dollar_value"]
    else
      end

    # #Price Lunch
    lunch = city_living_details[0]["data"].select {|element| element["id"] == "COST-RESTAURANT-MEAL"}[0]
      CityFeature.create!(
      score: lunch["currency_dollar_value"],
      feature: lunch_feature,
      city: new_city
      )
    #puts lunch["label"]
    #puts lunch["currency_dollar_value"]

    #  #Price Taxi
    taxi = city_living_details[0]["data"].select {|element| element["id"] == "COST-TAXI"}[0]
    if taxi == []
      CityFeature.create!(
      score: taxi["currency_dollar_value"]*100,
      feature: taxi_feature,
      city: new_city
      )
      #puts taxi["label"]
      #puts taxi["currency_dollar_value"]
    else
    end
  end


  #Languages speaking
  city_languages_details = city_details["categories"].select { |data| data["id"] == "LANGUAGE"}
  if city_languages_details.empty?
  else
    spoken_language = city_languages_details[0]["data"].select {|element| element["id"] == "SPOKEN-LANGUAGES"}[0]
    if spoken_language == []
    CityFeature.create!(
    score: spoken_language["string_value"],
    feature: language_feature,
    city: new_city
    )
    else
    end
    #puts spoken_language["label"]
    #puts spoken_language["string_value"]
  end


  #Internet Access_Download
  city_download_details = city_details["categories"].select { |data| data["id"] == "NETWORK"}
  if city_download_details.empty?
  else
    download = city_download_details[0]["data"].select {|element| element["id"] == "NETWORK-DOWNLOAD"}[0]
    if download == []
    CityFeature.create!(
    score: download["float_value"]*100,
    feature: download_feature,
    city: new_city
    )
    else
    end
    #puts download["label"]
    #puts download["float_value"]

  #Internet Access_Upload
    upload = city_download_details[0]["data"].select {|element| element["id"] == "NETWORK-UPLOAD"}[0]
    if download == []
    CityFeature.create!(
    score: upload["float_value"]*100,
    feature: upload_feature,
    city: new_city
    )
    else
    end
    #puts upload["label"]
    #puts upload["float_value"]
  end


  #Air Quality
  city_air_details = city_details["categories"].select { |data| data["id"] == "POLLUTION"}
  if city_air_details.empty?
  else

  air = city_air_details[0]["data"].select {|element| element["id"] == "AIR-POLLUTION-TELESCORE"}[0]
  CityFeature.create!(
  score: air["float_value"]*100,
  feature: air_feature,
  city: new_city
  )
  #puts air["label"]
  #puts air["float_value"]

  #Cleanliness
  clean = city_air_details[0]["data"].select {|element| element["id"] == "CLEANLINESS-TELESCORE"}[0]
  CityFeature.create!(
  score: clean["float_value"]*100,
  feature: cleanliness_feature,
  city: new_city
  )
  #puts clean["label"]
  #puts clean["float_value"]

  # #Drinking water quality
  water = city_air_details[0]["data"].select {|element| element["id"] == "DRINKING-WATER-QUALITY-TELESCORE"}[0]
    if water == []
      CityFeature.create!(
      score: water["float_value"]*100,
      feature: water_feature,
      city: new_city
      )
    else
    end
  #puts water["label"]
  #puts water["float_value"]
  end

  # #Crime rate score
  city_safety_details = city_details["categories"].select { |data| data["id"] == "SAFETY"}
  if city_safety_details.empty?
  else
  crime = city_safety_details[0]["data"].select {|element| element["id"] == "CRIME-RATE-TELESCORE"}[0]
  CityFeature.create!(
  score: crime["float_value"]*100,
  feature: crime_feature,
  city: new_city
  )
  #puts crime["label"]
  #puts crime["float_value"]
  end

  # #Coworking score
  city_space_details = city_details["categories"].select { |data| data["id"] == "STARTUPS"}
  if city_space_details.empty?
  else
  coworking = city_space_details[0]["data"].select {|element| element["id"] == "COWORKING-SPACES-TELESCORE"}[0]
  CityFeature.create!(
  score: coworking["float_value"]*100,
  feature: coworking_feature,
  city: new_city
  )
  #puts coworking["label"]
  #puts coworking["float_value"]
  end

  # #Heathlcare quality score
  city_care_details = city_details["categories"].select { |data| data["id"] == "HEALTHCARE"}
  if city_care_details.empty?
  else
  health = city_care_details[0]["data"].select {|element| element["id"] == "HEALTHCARE-QUALITY-TELESCORE"}[0]
  CityFeature.create!(
  score: health["float_value"]*100,
  feature: healthcare_feature,
  city: new_city
  )
  #puts health["label"]
  #puts health["float_value"]
  end


  # #Culture Art galleries  score
  city_culture_details = city_details["categories"].select { |data| data["id"] == "CULTURE"}
  if city_culture_details.empty?
  else
  art = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-ART-GALLERIES-TELESCORE"}[0]
  CityFeature.create!(
  score: art["float_value"]*100,
  feature: art_feature,
  city: new_city
  )
  #puts art["label"]
  #puts art["float_value"]


  #Culture Concerts score
  concert = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-CONCERTS-TELESCORE"}[0]
  CityFeature.create!(
  score: concert["float_value"]*100,
  feature: concert_feature,
  city: new_city
  )
  #puts concert["label"]
  #puts concert["float_value"]

  #  #Culture historical sites score
  site = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-HISTORICAL-SITES-TELESCORE"}[0]
  CityFeature.create!(
  score: site["float_value"]*100,
  feature: site_feature,
  city: new_city
  )
  #puts site["label"]
  #puts site["float_value"]

  #  #Culture museum score
  museum = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-MUSEUMS-TELESCORE"}[0]
  CityFeature.create!(
  score: museum["float_value"]*100,
  feature: museum_feature,
  city: new_city
  )
  #puts museum["label"]
  #puts museum["float_value"]

  #Culture sports score
  sport = city_culture_details[0]["data"].select {|element| element["id"] == "CULTURE-SPORTS-TELESCORE"}[0]
  CityFeature.create!(
  score: sport["float_value"]*100,
  feature: sport_feature,
  city: new_city
  )
  #puts sport["label"]
  #puts sport["float_value"]
  end


end



puts "Making Climates"

City.all.each do |city|
  Climate.create!(
    january: 10,
    february: 12,
    march: 14,
    april: 17,
    may: 17,
    june: 20,
    july: 24,
    august: 25,
    september: 24,
    october: 18,
    november: 7,
    december: 4,
    city: city
  )
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

skiing = Theme.create!(
  name: "Skiing")

puts "Making City_Themes"

City.all.each do |city|

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
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# puts "Making the Cities/Climates"


# vancouver = City.create!(
#   name: "Vancouver",
#   location: "Vancouver",
#   country: canada
#   )

# vancouver_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: vancouver
#   )

# file24 = URI.open('https://images.unsplash.com/photo-1559511260-66a654ae982a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# vancouver.photos.attach(io: file24, filename: 'vancouver1.jpeg', content_type: 'image/jpeg')

# file25 = URI.open('https://images.unsplash.com/photo-1560813962-ff3d8fcf59ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# vancouver.photos.attach(io: file25, filename: 'vancouver2.jpeg', content_type: 'image/jpeg')

# file26 = URI.open('https://images.unsplash.com/photo-1567705781280-0e03ffb323f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# vancouver.photos.attach(io: file26, filename: 'vancouver3.jpeg', content_type: 'image/jpeg')

# file27 = URI.open('https://images.unsplash.com/photo-1560814304-4f05b62af116?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# vancouver.photos.attach(io: file27, filename: 'vancouver3.jpeg', content_type: 'image/jpeg')

# paris = City.create!(
#   name: "Paris",
#   location: "Paris",
#   country: france
#   )

# paris_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: paris
#   )

# file28 = URI.open('https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# paris.photos.attach(io: file28, filename: 'paris1.jpeg', content_type: 'image/jpeg')

# file29 = URI.open('https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# paris.photos.attach(io: file29, filename: 'paris2.jpeg', content_type: 'image/jpeg')

# melbourne = City.create!(
#   name: "Melbourne",
#   location: "Melbourne",
#   country: australia
#   )

# melbourne_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: melbourne
#   )

# file30 = URI.open('https://images.unsplash.com/photo-1514395462725-fb4566210144?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# melbourne.photos.attach(io: file30, filename: 'melbourne1.jpeg', content_type: 'image/jpeg')

# file31 = URI.open('https://images.unsplash.com/photo-1494236472818-d35e50e604cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# melbourne.photos.attach(io: file31, filename: 'melbourne2.jpeg', content_type: 'image/jpeg')

# file32 = URI.open('https://images.unsplash.com/photo-1544419751-cb964c35c9a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# melbourne.photos.attach(io: file32, filename: 'melbourne3.jpeg', content_type: 'image/jpeg')

# file33 = URI.open('https://images.unsplash.com/photo-1543557211-135d718a528c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# melbourne.photos.attach(io: file33, filename: 'melbourne4.jpeg', content_type: 'image/jpeg')

# madrid = City.create!(
#   name: "Madrid",
#   location: "Madrid",
#   country: spain
#   )

# madrid_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: madrid
#   )

# file34 = URI.open('https://images.unsplash.com/photo-1570698473651-b2de99bae12f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# madrid.photos.attach(io: file34, filename: 'madrid1.png', content_type: 'image/jpeg')

# file35 = URI.open('https://images.unsplash.com/photo-1558370781-d6196949e317?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
# madrid.photos.attach(io: file35, filename: 'madrid2.png', content_type: 'image/jpeg')

# lisbon = City.create!(
#   name: "Lisbon",
#   location: "Lisbon",
#   country: portugal
#   )

# lisbon_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: lisbon
#   )



# new_york = City.create!(
#   name: "New York",
#   location: "New York",
#   country: usa
#   )

# new_york_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: new_york
#   )

# buenos_aires = City.create!(
#   name: "Buenos Aires",
#   location: "Buenos Aires",
#   country: argentina
#   )

# buenos_aires_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: buenos_aires
#   )

# lima = City.create!(
#   name: "Lima",
#   location: "Lima",
#   country: peru
#   )

# lima_climate = Climate.create!(
#   january: 10,
#   february: 12,
#   march: 14,
#   april: 17,
#   may: 17,
#   june: 20,
#   july: 24,
#   august: 25,
#   september: 24,
#   october: 18,
#   november: 7,
#   december: 4,
#   city: lima
#   )


# puts "Making the Themes"

# romantic = Theme.create!(
#   name: "Romantic")

# city = Theme.create!(
#   name: "City")

# beach = Theme.create!(
#   name: "Beach")

# culture = Theme.create!(
#   name: "Culture")

# skiing = Theme.create!(
#   name: "Skiing")


# vancouver_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: romantic,
#   city: vancouver)

# paris_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: romantic,
#   city: paris)

# paris_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: culture,
#   city: paris)

# melbourne_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: beach,
#   city: melbourne)

# melbourne_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: city,
#   city: melbourne)

# madrid_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: romantic,
#   city: madrid)

# madrid_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: city,
#   city: madrid)

# lisbon_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: beach,
#   city: lisbon
#   )

# lisbon_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: romantic,
#   city: lisbon
#   )


# new_york_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: romantic,
#   city: new_york)

# new_york_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: city,
#   city: new_york)

# buenos_aires_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: culture,
#   city: buenos_aires)

# buenos_aires_themes1 = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: city,
#   city: buenos_aires)

# lima_themes = CityTheme.create!(
#   january: 1,
#   february: 1,
#   march: 1,
#   april: 1,
#   may: 1,
#   june: 1,
#   july: 1,
#   august: 1,
#   september: 1,
#   october: 1,
#   november: 1,
#   december: 1,
#   theme: culture,
#   city: lima
#   )

# puts "Making the Features"

# humidity = Feature.create!(
#   name: "Humidity",
#   weight: 40
#   )

# healthcare = Feature.create!(
#   name: "Healthcare",
#   weight: 80
#   )

# education = Feature.create!(
#   name: "Education",
#   weight: 60
#   )

# lbgt = Feature.create!(
#   name: "LBGT",
#   weight: 60
#   )

# vancouver_features = CityFeature.create!(
#   feature: humidity,
#   city: vancouver,
#   score: 32)

# vancouver_features1 = CityFeature.create!(
#   feature: education,
#   city: vancouver,
#   score: 76)

# vancouver_features2 = CityFeature.create!(
#   feature: lbgt,
#   city: vancouver,
#   score: 85)

# vancouver_features3 = CityFeature.create!(
#   feature: healthcare,
#   city: vancouver,
#   score: 85)

# melbourne_features = CityFeature.create!(
#   feature: humidity,
#   city: melbourne,
#   score: 70)

# melbourne_features1 = CityFeature.create!(
#   feature: education,
#   city: melbourne,
#   score: 76)

# melbourne_features2 = CityFeature.create!(
#   feature: lbgt,
#   city: melbourne,
#   score: 50)

# melbourne_features3 = CityFeature.create!(
#   feature: healthcare,
#   city: melbourne,
#   score: 90)

# puts "Yeah Baby! Seeds are done. Didi you the man."
