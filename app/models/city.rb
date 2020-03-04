class City < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :country
  has_one :climate
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
end
