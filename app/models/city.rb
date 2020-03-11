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
      country: [ :name ]
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
    # ["Beach", "Romantic"] holiday with a temp around "25C" in ["July", "August"]

    City.joins(:themes).where(themes:{name: 'Beach'})
        .joins(:city_themes).where(city_themes:{july: 1})
        .joins(:climate).where(climates:{july: 300..1000})
        .count

    # make it compatible with multiple months given in params
    # Do one query for each given theme

  end
end
