class Post < ApplicationRecord
  belongs_to :user
  has_one :image, dependent: :destroy #image will be deleted when post is destroyed
  #yelp has their own latitude and longitude; no need to use geocoder
  #geocoded_by :location
  #after_validation :geocode
end
