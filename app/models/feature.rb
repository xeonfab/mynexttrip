class Feature < ApplicationRecord
  has_many :city_features
  has_many :cities, through: :city_features
end
