class TopsController < ApplicationController
  def index
    @movie_evaluations = MovieEvaluation.all.limit(3)
  end

  def search
  end

  def show
    if params[:id]
      @movie_evaluations = MovieEvaluation.where(movie_id:params[:id])
    end
  end

end
