class BookingProvider < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :city, optional: true
end
