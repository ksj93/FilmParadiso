require 'rails_helper'

RSpec.describe 'メッセージ送受信機能', type: :system do
  describe 'メッセージの送受信' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:user_second) {FactoryBot.create(:user_second)}
    let!(:conversation) {FactoryBot.create(:conversation,sender_id:user.id,recipient_id:user_second.id)}
    context '自身からメッセージを送信' do
      it '送ったメッセージが履歴に残る' do
        message = FactoryBot.create(:message,conversation:conversation,user:user,read:false)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/users/index"
        click_link "メッセージ"
        expect(page).to have_content "hi"
      end
    end
    context '他人からメッセージを受信' do
      it '受けたメッセージが履歴に残る' do
        message = FactoryBot.create(:second_message,conversation:conversation,user:user_second,read:false)
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/users/index"
        click_link "メッセージ"
        expect(page).to have_content "hello"
      end
    end
  end
end
