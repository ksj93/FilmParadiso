require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザを新規作成した場合' do
      it 'プロフィールを確認できる' do
        user = FactoryBot.create(:user)
        RSpec.configuration.session[:user_id] = user.id
        visit users_show_path
        expect(page).to have_content 'AA様のプロフィール'
      end
    end
  #   context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
  #     it 'ログイン画面に飛ぶ' do
  #       user = FactoryBot.create(:user)
  #       visit tasks_path
  #       expect(current_path).to eq sessions_new_path
  #     end
  #   end
  # end
  #
  # describe 'セッション機能のテスト' do
  #   context 'ログインした場合' do
  #     it 'プロフィール画面の飛ぶ' do
  #       user = FactoryBot.create(:user)
  #       visit sessions_new_path
  #       fill_in "session_email",with: "aa@test.com"
  #       fill_in "session_password",with: "123456"
  #       click_button "Log in"
  #       expect(RSpec.configuration.session[:user_id]).to eq user.id
  #     end
  #   end
  #   context '自分の詳細画面(マイページ)に飛べる場合' do
  #     it '自分の詳細情報の確認ができる' do
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = user.id
  #       visit user_path(user.id)
  #       expect(page).to have_content "aa@test.com"
  #     end
  #   end
  #   context '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移する' do
  #     it 'タスク一覧に飛ぶ' do
  #       user = FactoryBot.create(:user)
  #       user2 = FactoryBot.create(:user_second)
  #       RSpec.configuration.session[:user_id] = user.id
  #       visit user_path(user2.id)
  #       expect(current_path).to eq tasks_path
  #     end
  #   end
  #   context 'ログアウトする場合' do
  #     it 'ログイン画面に戻る' do
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = user.id
  #       visit user_path(user.id)
  #       click_link "Logout"
  #       expect(current_path).to eq sessions_new_path
  #     end
  #   end
  # end
  #
  # describe '管理画面のテスト' do
  #   context '管理ユーザが管理画面にアクセスした場合' do
  #     it '登録されてユーザの情報が確認できる' do
  #       admin = FactoryBot.create(:admin)
  #       FactoryBot.create(:user)
  #       FactoryBot.create(:user_second)
  #       RSpec.configuration.session[:user_id] = admin.id
  #       visit admin_users_path
  #       user_list = all('tbody tr')
  #       expect(user_list.count).to eq User.count
  #     end
  #   end
  #   context '一般ユーザが管理画面にアクセスしようよする場合' do
  #     it 'タスク画面に飛ばされる' do
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = user.id
  #       visit admin_users_path
  #       expect(current_path).to eq tasks_path
  #     end
  #   end
  #   context '管理ユーザがユーザの新規登録する場合' do
  #     it '登録した後、管理画面で確認できる' do
  #       admin = FactoryBot.create(:admin)
  #       RSpec.configuration.session[:user_id] = admin.id
  #       visit admin_users_path
  #       click_link 'Create New User'
  #       fill_in "user_name",with: "rspec"
  #       fill_in "user_email",with: "rspec@test.com"
  #       fill_in "user_password",with: "12345"
  #       fill_in "user_password_confirmation",with: "12345"
  #       click_button "Create my account"
  #       user_list = all('tbody tr')
  #       expect(user_list.count).to eq User.count
  #     end
  #   end
  #   context '管理ユーザがユーザの詳細画面にアクセスする場合' do
  #     it '該当ユーザの詳細画面に移動、確認できる' do
  #       admin = FactoryBot.create(:admin)
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = admin.id
  #       visit user_path(user.id)
  #       expect(current_path).to eq user_path(user.id)
  #
  #     end
  #   end
  #   context '管理ユーザがユーザの編集画面からユーザを編集する場合' do
  #     it '該当ユーザの情報が修正・反映できる' do
  #       admin = FactoryBot.create(:admin)
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = admin.id
  #       visit edit_admin_user_path(user.id)
  #       # user_list = all('tbody tr')
  #       expect(User.count).to eq 2
  #       fill_in "user_name",with: "rspec_edit"
  #       fill_in "user_password",with: "12345"
  #       fill_in "user_password_confirmation",with: "12345"
  #       click_button "Create my account"
  #       expect(User.count).to eq 2
  #       expect(User.find(user.id).name).to have_content "rspec_edit"
  #     end
  #   end
  #   context '管理ユーザがユーザの削除する場合' do
  #     it '該当ユーザの情報が削除しユーザの数が減る' do
  #       admin = FactoryBot.create(:admin)
  #       user = FactoryBot.create(:user)
  #       RSpec.configuration.session[:user_id] = admin.id
  #       visit admin_users_path
  #       page.all('.del')[1].click
  #       # binding.irb
  #       expect(User.count).to eq 1
  #
  #     end
  #   end
  end
end
