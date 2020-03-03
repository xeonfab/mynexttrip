class Theme < ApplicationRecord
  has_many :city_themes
  has_many :cities, through: :city_themes
end
