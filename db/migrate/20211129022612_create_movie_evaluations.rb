class CreateMovieEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_evaluations do |t|
      t.string :short_criticism,null: false
      t.float :score,null: false
      t.integer :movie_id,null: false

      t.timestamps
    end
  end
end
