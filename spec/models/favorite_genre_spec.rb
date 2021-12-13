require 'rails_helper'

describe 'お好みジャンルモデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:favorite_genre) {FactoryBot.create(:favorite_genre,user:user)}
  describe 'バリデーションのテスト' do
    context 'ユーザーが既に、追加したお好みジャンルを追加しようとする場合' do
      it 'バリデーションにひっかる' do
        new_favorite_genre = FavoriteGenre.new(genre_name:"action",genre_id:14,user_id:user.id)
        expect(new_favorite_genre).not_to be_valid
      end
    end
    context 'ユーザーがお好みたジャンルを追加しようとする場合' do
      it 'バリデーションが通る' do
        new_favorite_genre = FavoriteGenre.new(genre_name:"fantasy",genre_id:28,user_id:user.id)
        expect(new_favorite_genre).to be_valid
      end
    end
  end
end
