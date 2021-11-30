class ApplicationController < ActionController::Base
  require 'themoviedb-api'
  Tmdb::Api.key("f351e2da846ddea6294e5547f0820d21")
  Tmdb::Api.language("ja")
end
