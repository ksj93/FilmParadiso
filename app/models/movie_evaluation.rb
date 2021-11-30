class MovieEvaluation < ApplicationRecord
  validates :short_criticism,presence:true, length:{maximum:50}
  validates :movie_id, presence:true
  validates :score, presence:true
  # ,  numericality: {greater_than_or_equal_to:1,less_than_or_equal_to: 5}
end
