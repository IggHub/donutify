json.extract! post, :id, :phone, :image_url, :open, :location, :name, :rating, :created_at, :updated_at
json.url post_url(post, format: :json)