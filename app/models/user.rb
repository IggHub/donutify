class User < ApplicationRecord
  has_many :posts
  geocoded_by :address
  after_validation :geocode

end
