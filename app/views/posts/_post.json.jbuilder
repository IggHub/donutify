json.extract! post, :id, :body, :price, :city, :external_url, :timestamp, :created_at, :updated_at
json.url post_url(post, format: :json)