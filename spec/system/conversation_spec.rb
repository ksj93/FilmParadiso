require 'rails_helper'

RSpec.describe '会話ルームの生成機能', type: :system do
  describe '他のユーザーにメッセージを投げる場合' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:user_second) {FactoryBot.create(:user_second)}
    context '初めてメッセージを送るユーザーの場合' do
      it '空きの新しい会話ルームを生成する' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/users/index"
        click_link "メッセージ"
        expect(Conversation.where(sender_id:user.id).count).to eq 1
      end
    end
    context '以前にメッセージを送ったことがあるユーザーの場合' do
      it '前、使っていたメッセージが確認できる' do
        visit user_session_path
        conversation = FactoryBot.create(:conversation,sender_id:user.id,recipient_id:user_second.id)
        message = FactoryBot.create(:message,conversation:conversation,user:user,read:true)
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/users/index"
        click_link "メッセージ"
        expect(page).to have_content "hi"
      end
    end
  end
end
