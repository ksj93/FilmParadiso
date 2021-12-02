class Like < ApplicationRecord
  belongs_to :user
  belongs_to :movie_evaluation
end
