require 'rails_helper'

describe 'メッセージモデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:user_second) {FactoryBot.create(:user_second)}
  let!(:conversation) {FactoryBot.create(:conversation,sender_id:user.id,recipient_id:user_second.id)}
  describe 'バリデーションのテスト' do
    context 'メッセージの内容が空きの場合' do
      it 'バリデーションにひっかる' do
        message = Message.new(body:"",conversation_id:conversation.id,user_id:user.id)
        expect(message).not_to be_valid
      end
    end
    context 'メッセージの内容がある場合' do
      it 'バリデーションが通る' do
        message = Message.new(body:"test text",conversation_id:conversation.id,user_id:user.id)
        expect(message).to be_valid
      end
    end
  end
end
