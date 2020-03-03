class CityTheme < ApplicationRecord
  belongs_to :city
  belongs_to :theme
# remember that the city themes are saved as either a 0 or 1, NOT as a boolean value

end

