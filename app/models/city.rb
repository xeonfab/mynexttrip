class City < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :country
  has_one :climate
  has_one :region, through: :country
  has_many :booking_providers
  has_many :city_themes
  has_many :themes, through: :city_themes
  has_many :city_features
  has_many :features, through: :city_features

  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    associated_against: {
      country: [ :name ],
      region: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # City.with_scores({"cost_of_living"=>"51", "air_quality"=>"51"})
  def self.with_scores(filters)
    sql = filters.map do |filter_name, score|
      City.joins(city_features: :feature).where(city_features: { score: score.to_i..101, features: { name: filter_name.to_s.titleize.capitalize } })

    end.map { |relation| "(#{relation.to_sql})" }.join(" INTERSECT ")

    find_by_sql(sql)
  end


  # Returns a list of cities that meet the user's criteria of travel theme, month, and temperature
  def self.initial_search(filters)
    filters = {
      themes: ["Beach", "Romantic", "Countryside"],
      temp: 25,
      months: ["July", "August"]
    }

    city_themes_months = {} # { july: 1, august: 1 }
    climate_months = {} # { july: 25..1000, august: 25..1000 }
    region_names = {}

    # Populate the city_themes_months hash and the climate_months hash
    filters[:months].each do |month|
      key = month.downcase.to_sym
      city_themes_months[key] = 1
      climate_months[key] = filters[:temp]..1000
    end

    # filter_results[:themes].each do |theme|
    #   key = theme.downcase.to_sym

    # end

    # iterate over array (months) and create a new pair

    # ["Beach", "Romantic"] holiday with a temp around "25C" in ["July", "August"]
    # make it compatible with multiple months given in params
    City.joins(:themes).where(themes: [:filter_results[:themes]])
        .joins(:city_themes).where(city_themes: city_themes_months)
        .joins(:climate).where(climates: climate_months)
        .joins(:region).where(regions: region_names)

    # TO DO
    # Do one query for each given theme
  end
end


# Model.where(id: [array of values])
