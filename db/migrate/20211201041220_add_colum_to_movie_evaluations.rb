class AddColumToMovieEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_reference :movie_evaluations, :user, foreign_key: true
  end
end
