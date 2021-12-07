class FavoriteGenre < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :genre_name, scope: :user_id
end
