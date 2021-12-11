FactoryBot.define do
  factory :movie_evaluation do
    short_criticism { "AA" }
    score { 1.5 }
    movie_id { 123 }
  end
  factory :movie_evaluation_second, class:MovieEvaluation do
    short_criticism { "BB" }
    score { 3 }
    movie_id { 456 }
  end
  factory :movie_evaluation_third, class:MovieEvaluation do
    short_criticism { "CC" }
    score { 4.5 }
    movie_id { 789 }
  end
end
