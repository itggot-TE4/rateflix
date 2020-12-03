json.extract! movie, :id, :title, :created_at, :updated_at
json.url api_v1_movie_url(movie, format: :json)
