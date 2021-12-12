require 'rails_helper'

RSpec.describe '映画の情報閲覧機能', type: :system do
  describe '映画の情報閲覧機能' do
    context '映画の検索する場合' do
      it '入力したキーワードと関連がある映画が検索できる' do
        visit "/tops/search"
        fill_in "looking_for",with: "万引き"
        click_button "検索"
        expect(page).to have_content "万引き家族"
      end
    end
    context '映画の詳細情報を確認する場合' do
      it '選択した映画の情報が確認できる' do
        visit "/tops/search"
        fill_in "looking_for",with: "蜘蛛巣"
        click_button "検索"
        click_link "蜘蛛巣城"
        expect(page).to have_content "映画「蜘蛛巣城」の詳細情報"
        expect(page).to have_content "タイトル"
        expect(page).to have_content "リリース"
        expect(page).to have_content "上映時間"
        expect(page).to have_content "ジャンル"
        expect(page).to have_content "あらすじ"
        expect(page).to have_content "監督"
        expect(page).to have_content "出演"
      end
    end
  end
end
