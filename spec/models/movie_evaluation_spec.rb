require 'rails_helper'

describe '映画評価モデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  describe 'バリデーションのテスト' do
    context '映画評価の批評が空の場合' do
      it 'バリデーションにひっかる' do
        movie_evaluation = MovieEvaluation.new(short_criticism:"",score:3,movie_id:566525,user:user)
        expect(movie_evaluation).not_to be_valid
      end
    end
    context '映画評価の評点が空の場合' do
      it 'バリデーションにひっかかる' do
        movie_evaluation = MovieEvaluation.new(short_criticism:"テスト",score:"",movie_id:566525,user:user)
        expect(movie_evaluation).not_to be_valid
      end
    end
    context '映画評価の映画idが空の場合' do
      it 'バリデーションにひっかかる' do
        movie_evaluation = MovieEvaluation.new(short_criticism:"テスト",score:3,movie_id:"",user:user)
        expect(movie_evaluation).not_to be_valid
      end
    end
    context '映画評価の批評と評点と映画idが記載されている場合' do
      it 'バリデーションが通る' do
        movie_evaluation = MovieEvaluation.new(short_criticism:"テスト",score:3,movie_id:566525,user:user)
        expect(movie_evaluation).to be_valid
      end
    end
  end
end
