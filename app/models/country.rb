class Country < ApplicationRecord
  belongs_to :region
  has_many :cities
  has_many :booking_providers
  has_many_attached :photos
end
