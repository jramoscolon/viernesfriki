json.extract! episode, :id, :name, :description, :image_url, :created_at, :updated_at
json.url episode_url(episode, format: :json)