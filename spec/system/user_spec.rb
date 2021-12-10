require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザを新規作成した場合' do
      it 'プロフィールを確認できる' do
        user = FactoryBot.create(:user)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit users_show_path
        expect(page).to have_content 'AA様のプロフィール'
      end
    end

    context 'ユーザがログインせず評価の投稿などを行う場合' do
      it 'ログイン画面に飛ぶ' do
        user = FactoryBot.create(:user)
        visit new_movie_evaluation_path
        expect(current_path).to eq user_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ログアウトする場合' do
      it 'トップ画面に戻る' do
        user = FactoryBot.create(:user)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        click_link "ログアウト"
        expect(current_path).to eq root_path
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理ユーザが管理画面にアクセスした場合' do
      it 'rails adminの管理画面に飛ぶ' do
        admin = FactoryBot.create(:admin)
        visit user_session_path
        fill_in "user_email",with: "ee@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit rails_admin_path
        expect(current_path).to eq rails_admin_path
      end
    end
    context '管理ユーザ(ゲスト)が管理画面にアクセスした場合' do
      it 'rails adminの管理画面に飛ぶ' do
        admin = FactoryBot.create(:guset_admin)
        visit user_session_path
        fill_in "user_email",with: "dd@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit rails_admin_path
        expect(current_path).to eq rails_admin_path
      end
    end
    context '一般ユーザが管理画面にアクセスしようよする場合' do
      it 'トップ画面に戻る' do
        user = FactoryBot.create(:user)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit rails_admin_path
        expect(current_path).to eq root_path
      end
    end
    context '一般ユーザ(ゲスト)が管理画面にアクセスしようよする場合' do
      it 'トップ画面に戻る' do
        user = FactoryBot.create(:guest)
        visit user_session_path
        fill_in "user_email",with: "cc@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit rails_admin_path
        expect(current_path).to eq root_path
      end
    end

    # context '管理ユーザが管理画面にアクセスし、映画の評価を投稿した場合' do
    #   it '映画の評価を投稿が出来る' do
    #     user = FactoryBot.create(:user)
    #     admin = FactoryBot.create(:admin)
    #     visit user_session_path
    #     fill_in "user_email",with: "ee@test.com"
    #     fill_in "user_password",with: "123456"
    #     click_button "ログイン"
    #     visit 'admin/movie_evaluation/new'
    #     fill_in "movie_evaluation_short_criticism",with: "testtest"
    #     fill_in "movie_evaluation_score",with: 4.5
    #     fill_in "movie_evaluation_movie_id",with: 5121
    #     # fill_in "movie_evaluation_user_id",with: 5121
    #
    #     select 'AA',from:'movie_evaluation[user_id]'
    #
    #     click_button "保存"
    #     expect(page).to have_content 'testtest'
    #   end
    # end
    context '管理ユーザがユーザの管理画面にアクセスする場合' do
      it 'ユーザの一覧が確認できる' do
        user = FactoryBot.create(:user)
        admin = FactoryBot.create(:admin)
        visit user_session_path
        fill_in "user_email",with: "ee@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/admin/user/"
        expect(page).to have_content 'ユーザーの一覧'
        user_list = all('tbody tr')
        expect(user_list.count).to eq User.count
      end
    end
    context '管理ユーザ(ゲスト)がユーザの管理画面にアクセスする場合' do
      it 'ユーザの一覧が確認できる' do
        user = FactoryBot.create(:user)
        admin = FactoryBot.create(:guset_admin)
        visit user_session_path
        fill_in "user_email",with: "dd@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/admin/user/"
        expect(page).to have_content 'ユーザーの一覧'
        user_list = all('tbody tr')
        expect(user_list.count).to eq User.count
      end
    end
    context '管理ユーザがユーザの編集画面からユーザを編集する場合' do
      it '該当ユーザの情報が修正・反映できる' do
        user = FactoryBot.create(:user)
        admin = FactoryBot.create(:admin)
        visit user_session_path
        fill_in "user_email",with: "ee@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/admin/user/#{user.id}/edit"
        fill_in "user_name",with: "rspec_edit"
        click_button "保存"
        expect(User.count).to eq 2
        expect(User.find(user.id).name).to have_content "rspec_edit"
      end
    end
    context '管理ユーザがユーザの削除する場合' do
      it 'ユーザの情報削除しユーザの数が減る' do
        user = FactoryBot.create(:user)
        admin = FactoryBot.create(:admin)
        visit user_session_path
        fill_in "user_email",with: "ee@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/admin/user/#{user.id}/delete"
        click_button "実行する"
        expect(page).to have_content 'ユーザーの一覧'
        user_list = all('tbody tr')
        expect(user_list.count).to eq 1
      end
    end
  end
end
