json.extract! user, :id, :latitude, :longitude, :address, :description, :name, :created_at, :updated_at
json.url user_url(user, format: :json)