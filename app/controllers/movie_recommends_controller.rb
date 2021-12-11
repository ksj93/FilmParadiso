class MovieRecommendsController < ApplicationController
  def index
    @favorite_genres = current_user.favorite_genres

  end
end
