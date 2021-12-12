require 'rails_helper'

RSpec.describe 'お好みジャンル管理機能', type: :system do
  describe 'お好みジャンル追加・削除機能' do
    let!(:user) {FactoryBot.create(:user)}
    context 'ジャンルを選択して追加する場合' do
      it '自身のお好みジャンルリストに自身が選択したジャンルが追加される' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        visit "/users/show"
        expect(page).to have_content "アドベンチャー"
      end
    end
    context 'すでに、追加したジャンルと同じジャンルを追加使用とする場合' do
      it '追加できず、お好みジャンルリストに追加されない' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        expect(user.favorite_genres.count).to eq 1
      end
    end
    context 'ジャンルを制限値である3個以上を追加しようする場合' do
      it '追加できず、お好みジャンルリストに追加されない' do
        visit user_session_path
        favorite1 = FactoryBot.create(:favorite_genre,user:user)
        favorite2 = FactoryBot.create(:second_favorite_genre,user:user)
        favorite3 = FactoryBot.create(:third_favorite_genre,user:user)
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        expect(user.favorite_genres.count).to eq 3
      end
    end
  end
end
