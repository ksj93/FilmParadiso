require 'rails_helper'

RSpec.describe '映画のおすすめ機能', type: :system do
  describe 'お好みジャンルの数に基づいた映画のおすすめ機能' do
    let!(:user) {FactoryBot.create(:user)}
    context 'ジャンルが一つの場合' do
      it '一つのジャンルで絞った映画をおすすめする' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アクション"
        page.driver.browser.switch_to.alert.accept
        visit "/movie_recommends"
        expect(page).to have_content "アクション ジャンルのおすすめ映画"
      end
    end
    context 'ジャンルが二つの場合' do
      it '二つのジャンルで絞った映画をおすすめする' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アクション"
        page.driver.browser.switch_to.alert.accept
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        visit "/movie_recommends"
        expect(page).to have_content "アクションとアドベンチャー ジャンルのおすすめ映画"
      end
    end
    context 'ジャンルが三つの場合' do
      it '三つのジャンルで絞った映画をおすすめする' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アクション"
        page.driver.browser.switch_to.alert.accept
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        click_link "ファンタジー"
        page.driver.browser.switch_to.alert.accept
        visit "/movie_recommends"
        expect(page).to have_content "アクションとアドベンチャーとファンタジー ジャンルのおすすめ映画"
      end
    end
    context 'ジャンルが三つの場合' do
      it '三つの内、二つのジャンルに絞った映画をおすすめする' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/favorite_genres/new"
        click_link "アクション"
        page.driver.browser.switch_to.alert.accept
        click_link "アドベンチャー"
        page.driver.browser.switch_to.alert.accept
        click_link "ファンタジー"
        page.driver.browser.switch_to.alert.accept
        visit "/movie_recommends"
        expect(page).to have_content "アクションとアドベンチャー ジャンルのおすすめ映画"
        expect(page).to have_content "アクションとファンタジー ジャンルのおすすめ映画"
        expect(page).to have_content "アドベンチャーとファンタジー ジャンルのおすすめ映画"
      end
    end
  end
end
