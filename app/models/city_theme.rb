class CityTheme < ApplicationRecord
  belongs_to :city
  belongs_to :theme
# remember that the city themes are saved as either a 0 or 1, NOT as a boolean value

    include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      theme: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end

