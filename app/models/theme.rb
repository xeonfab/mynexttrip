class Theme < ApplicationRecord
  has_many :city_themes
  has_many :cities, through: :city_themes

    include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    # associated_against: {
    #   country: [ :name ]
    # },
    using: {
      tsearch: { prefix: true }
    }
end
