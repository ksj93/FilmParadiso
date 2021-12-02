class TopsController < ApplicationController
  def index
    @movie_evaluations = MovieEvaluation.all
  end

  def search
  end

  def show
  end

end
