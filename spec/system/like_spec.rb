require 'rails_helper'

RSpec.describe 'いいね！管理機能', type: :system do
  describe 'いいね！管理機能' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:user_second) {FactoryBot.create(:user_second)}
    let!(:guest) {FactoryBot.create(:guest)}
    let!(:movie_evaluation) {FactoryBot.create(:movie_evaluation,user:user)}
    let!(:movie_evaluation_second) {FactoryBot.create(:movie_evaluation_second,user:user_second)}
    let!(:movie_evaluation_third) {FactoryBot.create(:movie_evaluation_third,user:guest)}
    context '他のユーザーの映画評価にいいね！をあげる場合' do
      it 'いいね！した映画評価のlike総数が増える' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/movie_evaluations/#{movie_evaluation_second.id}"
        find('.fas').click
        expect(MovieEvaluation.find(movie_evaluation_second.id).likes.count).to eq 1
      end
    end
    context '他のユーザーから自身が書いた映画評価にいいね！をもらった場合' do
      it 'いいね！もらった映画評価のlike総数が増え' do
        visit user_session_path
        fill_in "user_email",with: "bb@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/movie_evaluations/#{movie_evaluation.id}"
        find('.fas').click
        expect(MovieEvaluation.find(movie_evaluation.id).likes.count).to eq 1
      end
    end
    context '自身がいいね！をあげた映画評価の一覧を確認する場合' do
      it '一覧にいいね！した映画評価を確認出来る' do
        like1 = FactoryBot.create(:like,user:user,movie_evaluation:movie_evaluation_second)
        like2 = FactoryBot.create(:second_like,user:user,movie_evaluation:movie_evaluation_third)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/likes"
        expect(page).to have_content "BB"
        expect(page).to have_content "CC"
        expect(page).to have_content 3
        expect(page).to have_content 4.5
      end
    end
  end
end
