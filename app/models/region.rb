class Region < ApplicationRecord
  has_many :countries
  has_many :cities, through: :countries
  has_one_attached :photo
end
