class MovieRecommendsController < ApplicationController
  require "movie_gem"
  def index
    @favorite_genres = current_user.favorite_genres

  end
end
