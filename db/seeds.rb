# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'
require "open-uri"

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
  name: "Australia and the Pacific",
  )

file5 = URI.open('https://images.unsplash.com/photo-1528163308254-5852067f0a1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
australia_and_pacific.photo.attach(io: file5, filename: 'AustraliaP1.jpeg', content_type: 'image/jpeg')

central_america = Region.create!(
  name: "Central America and the Carribean",
  )

file6 = URI.open('https://images.unsplash.com/photo-1518638150340-f706e86654de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1648&q=80')
central_america.photo.attach(io: file6, filename: 'CentralAmerica1.jpeg', content_type: 'image/jpeg')





puts "Making the Countries"

canada = Country.create!(
  name: "Canada",
  region: north_america
  )

file8 = URI.open('https://images.com/photo-1506104489822-562ca25152fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60')
canada.photos.attach(io: file8, filename: 'Canada1.jpeg', content_type: 'image/jpeg')

file9 = URI.open('https://images.unsplash.com/photo-1514924013411-cbf25faa35bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60')
canada.photos.attach(io: file9, filename: 'Canada2.jpeg', content_type: 'image/jpeg')

australia = Country.create!(
  name: "Australia",
  region: australia_and_pacific
  )

file10 = URI.open('https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60')
australia.photos.attach(io: file10, filename: 'Aus1.jpeg', content_type: 'image/jpeg')

file11 = URI.open('https://images.unsplash.com/photo-1548296404-93c7694b2f91?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60')
australia.photos.attach(io: file11, filename: 'Aus2.jpeg', content_type: 'image/jpeg')

spain = Country.create!(
  name: "Spain",
  region: europe
  )

file12 = URI.open('https://images.unsplash.com/photo-1558642084-fd07fae5282e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
spain.photos.attach(io: file12, filename: 'Spain1.jpeg', content_type: 'image/jpeg')

file13 = URI.open('https://images.unsplash.com/photo-1504019347908-b45f9b0b8dd5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
spain.photos.attach(io: file13, filename: 'Spain2.jpeg', content_type: 'image/jpeg')

france = Country.create!(
  name: "France",
  region: europe
  )

file14 = URI.open('https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
france.photos.attach(io: file14, filename: 'France1.jpeg', content_type: 'image/jpeg')

file15 = URI.open('https://images.unsplash.com/photo-1495442358998-961b69f45703?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
france.photos.attach(io: file15, filename: 'France2.jpeg', content_type: 'image/jpeg')

portugal = Country.create!(
  name: "Portugal",
  region: europe
  )

file16 = URI.open('https://images.unsplash.com/photo-1513377888081-794d8e958972?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
portugal.photos.attach(io: file16, filename: 'Portugal1.jpeg', content_type: 'image/jpeg')

file17 = URI.open('https://images.unsplash.com/photo-1555881400-69a2384edcd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
portugal.photos.attach(io: file17, filename: 'Portugal2.jpeg', content_type: 'image/jpeg')

usa = Country.create!(
  name: "United States of America",
  region: north_america
  )

file18 = URI.open('https://images.unsplash.com/photo-1471306224500-6d0d218be372?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
usa.photos.attach(io: file18, filename: 'usa1.jpeg', content_type: 'image/jpeg')

file19 = URI.open('https://images.unsplash.com/photo-1445368794737-0cf251429ca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
usa.photos.attach(io: file19, filename: 'usa2.jpeg', content_type: 'image/jpeg')

argentina = Country.create!(
  name: "Argentina",
  region: south_america
  )

file20 = URI.open('https://images.unsplash.com/photo-1508710285745-edc8137d6b5b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
argentina.photos.attach(io: file20, filename: 'argentina1.jpeg', content_type: 'image/jpeg')

file21 = URI.open('https://images.unsplash.com/photo-1545889238-ae8ff5ab582f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
argentina.photos.attach(io: file21, filename: 'argentina2.jpeg', content_type: 'image/jpeg')

peru = Country.create!(
  name: "Peru",
  region: south_america
  )

file22 = URI.open('https://images.unsplash.com/photo-1526392060635-9d6019884377?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1296&q=60')
peru.photos.attach(io: file22, filename: 'peru1.jpeg', content_type: 'image/jpeg')

file23 = URI.open('https://images.unsplash.com/photo-1531968455001-5c5272a41129?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
peru.photos.attach(io: file23, filename: 'peru2.jpeg', content_type: 'image/jpeg')



puts "Making the Cities/Climates"


vancouver = City.create!(
  name: "Vancouver",
  location: "Vancouver",
  country: canada
  )

vancouver_climate = Climate.create!(
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
  city: vancouver
  )

file24 = URI.open('https://images.unsplash.com/photo-1559511260-66a654ae982a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
vancouver.photos.attach(io: file24, filename: 'vancouver1.jpeg', content_type: 'image/jpeg')

file25 = URI.open('https://images.unsplash.com/photo-1560813962-ff3d8fcf59ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
vancouver.photos.attach(io: file25, filename: 'vancouver2.jpeg', content_type: 'image/jpeg')

file26 = URI.open('https://images.unsplash.com/photo-1567705781280-0e03ffb323f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
vancouver.photos.attach(io: file26, filename: 'vancouver3.jpeg', content_type: 'image/jpeg')

file27 = URI.open('https://images.unsplash.com/photo-1560814304-4f05b62af116?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
vancouver.photos.attach(io: file27, filename: 'vancouver3.jpeg', content_type: 'image/jpeg')

paris = City.create!(
  name: "Paris",
  location: "Paris",
  country: france
  )

paris_climate = Climate.create!(
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
  city: paris
  )

file28 = URI.open('https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
paris.photos.attach(io: file28, filename: 'paris1.jpeg', content_type: 'image/jpeg')

file29 = URI.open('https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
paris.photos.attach(io: file29, filename: 'paris2.jpeg', content_type: 'image/jpeg')

melbourne = City.create!(
  name: "Melbourne",
  location: "Melbourne",
  country: australia
  )

melbourne_climate = Climate.create!(
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
  city: melbourne
  )

file30 = URI.open('https://images.unsplash.com/photo-1514395462725-fb4566210144?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
melbourne.photos.attach(io: file30, filename: 'melbourne1.jpeg', content_type: 'image/jpeg')

file31 = URI.open('https://images.unsplash.com/photo-1494236472818-d35e50e604cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
melbourne.photos.attach(io: file31, filename: 'melbourne2.jpeg', content_type: 'image/jpeg')

file32 = URI.open('https://images.unsplash.com/photo-1544419751-cb964c35c9a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
melbourne.photos.attach(io: file32, filename: 'melbourne3.jpeg', content_type: 'image/jpeg')

file33 = URI.open('https://images.unsplash.com/photo-1543557211-135d718a528c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
melbourne.photos.attach(io: file33, filename: 'melbourne4.jpeg', content_type: 'image/jpeg')

madrid = City.create!(
  name: "Madrid",
  location: "Madrid",
  country: spain
  )

madrid_climate = Climate.create!(
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
  city: madrid
  )

file34 = URI.open('https://images.unsplash.com/photo-1570698473651-b2de99bae12f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
madrid.photos.attach(io: file34, filename: 'madrid1.png', content_type: 'image/jpeg')

file35 = URI.open('https://images.unsplash.com/photo-1558370781-d6196949e317?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1296&q=60')
madrid.photos.attach(io: file35, filename: 'madrid2.png', content_type: 'image/jpeg')

lisbon = City.create!(
  name: "Lisbon",
  location: "Lisbon",
  country: portugal
  )

lisbon_climate = Climate.create!(
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
  city: lisbon
  )



new_york = City.create!(
  name: "New York",
  location: "New York",
  country: usa
  )

new_york_climate = Climate.create!(
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
  city: new_york
  )

buenos_aires = City.create!(
  name: "Buenos Aires",
  location: "Buenos Aires",
  country: argentina
  )

buenos_aires_climate = Climate.create!(
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
  city: buenos_aires
  )

lima = City.create!(
  name: "Lima",
  location: "Lima",
  country: peru
  )

lima_climate = Climate.create!(
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
  city: lima
  )


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

vancouver_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 0,
  june: 0,
  july: 0,
  august: 0,
  september: 0,
  october: 0,
  november: 1,
  december: 1,
  theme: skiing,
  city: vancouver)

vancouver_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: romantic,
  city: vancouver)

paris_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: romantic,
  city: paris)

paris_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: culture,
  city: paris)

melbourne_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: beach,
  city: melbourne)

melbourne_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: city,
  city: melbourne)

madrid_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: romantic,
  city: madrid)

madrid_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: city,
  city: madrid)

lisbon_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: beach,
  city: lisbon
  )

lisbon_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: romantic,
  city: lisbon
  )


new_york_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: romantic,
  city: new_york)

new_york_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: city,
  city: new_york)

buenos_aires_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: culture,
  city: buenos_aires)

buenos_aires_themes1 = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: city,
  city: buenos_aires)

lima_themes = CityTheme.create!(
  january: 1,
  february: 1,
  march: 1,
  april: 1,
  may: 1,
  june: 1,
  july: 1,
  august: 1,
  september: 1,
  october: 1,
  november: 1,
  december: 1,
  theme: culture,
  city: lima
  )

puts "Making the Features"

humidity = Feature.create!(
  name: "Humidity",
  weight: 40
  )

healthcare = Feature.create!(
  name: "Healthcare",
  weight: 80
  )

education = Feature.create!(
  name: "Education",
  weight: 60
  )

lbgt = Feature.create!(
  name: "LBGT",
  weight: 60
  )

vancouver_features = CityFeature.create!(
  feature: humidity,
  city: vancouver,
  score: 32)

vancouver_features1 = CityFeature.create!(
  feature: education,
  city: vancouver,
  score: 76)

vancouver_features2 = CityFeature.create!(
  feature: lbgt,
  city: vancouver,
  score: 85)

vancouver_features3 = CityFeature.create!(
  feature: healthcare,
  city: vancouver,
  score: 85)

melbourne_features = CityFeature.create!(
  feature: humidity,
  city: melbourne,
  score: 70)

melbourne_features1 = CityFeature.create!(
  feature: education,
  city: melbourne,
  score: 76)

melbourne_features2 = CityFeature.create!(
  feature: lbgt,
  city: melbourne,
  score: 50)

melbourne_features3 = CityFeature.create!(
  feature: healthcare,
  city: melbourne,
  score: 90)

puts "Yeah Baby! Seeds are done. Didi you the man."
