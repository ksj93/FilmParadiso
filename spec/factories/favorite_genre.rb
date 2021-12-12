FactoryBot.define do
  factory :favorite_genre do
    genre_name { "action" }
    genre_id { 14 }
  end
  factory :second_favorite_genre, class:FavoriteGenre do
    genre_name { "fantasy" }
    genre_id { 28 }
  end
  factory :third_favorite_genre, class:FavoriteGenre do
    genre_name { "drama" }
    genre_id { 99 }
  end
end
