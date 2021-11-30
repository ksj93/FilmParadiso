json.extract! movie_evaluation, :id, :short_criticism, :score, :movie_id, :created_at, :updated_at
json.url movie_evaluation_url(movie_evaluation, format: :json)
