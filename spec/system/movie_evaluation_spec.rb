require 'rails_helper'

RSpec.describe '映画評価の管理機能', type: :system do
  describe '映画評価のCRUD機能' do
    let!(:user) {FactoryBot.create(:user)}
    context '映画評価を新規作成した場合' do
      it '作成済みの評価が一覧が表示される' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        movie_evaluation = FactoryBot.create(:movie_evaluation,user:user)
        visit movie_evaluations_path
        expect(page).to have_content 'AA'
        expect(page).to have_content 1.5
      end
    end
    context '作成した評価の詳細ページにアクセスする場合' do
      it '選択した評価の詳細情報が見れる' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        movie_evaluation = FactoryBot.create(:movie_evaluation,user:user)
        visit movie_evaluation_path(movie_evaluation.id)
        expect(page).to have_content 'AA'
        expect(page).to have_content 1.5
        expect(page).to have_content '映画の詳細情報'
      end
    end
    context '評価評価を編集した場合' do
      it '既存の情報が編集した情報に変わる' do

      end
    end
    context '映画評価を削除した場合' do
      it '全体の評価の数が減る' do

      end
    end
  end
  describe '一般ユーザー他人の評価にアクセス' do
    context '他人が作成した評価の詳細ページにアクセスする場合' do
      it '選択した評価の詳細情報が見れる' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        movie_evaluation = FactoryBot.create(:movie_evaluation,user:user)
        visit movie_evaluation_path(movie_evaluation.id)
        expect(page).to have_content 'AA'
        expect(page).to have_content 1.5
        expect(page).to have_content '映画の詳細情報'
      end
    end
    context '他人が作成した評価を編集しようとする場合' do
      it '編集を試した評価の詳細画面に飛ばされる' do

      end
    end
  end

  describe '管理者権限持ちのユーザーが他人の評価にアクセス' do
    context '他人が作成した評価の詳細ページにアクセスする場合' do
      it '他人が作成した評価の詳細情報が見れる' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        movie_evaluation = FactoryBot.create(:movie_evaluation,user:user)
        visit movie_evaluation_path(movie_evaluation.id)
        expect(page).to have_content 'AA'
        expect(page).to have_content 1.5
        expect(page).to have_content '映画の詳細情報'
      end
    end
    context '他人が作成した評価を編集しようとする場合' do
      it '既存の情報が編集した情報に変わる' do

      end
    end
    context '他人が作成した映画評価を削除した場合' do
      it '全体の評価の数が減る' do

      end
    end
  end
end
