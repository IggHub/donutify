class Post < ApplicationRecord
  has_one :image, dependent: :destroy #image will be deleted when post is destroyed
end
