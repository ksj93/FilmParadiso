require 'rails_helper'

describe '会話ルームモデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  let!(:user_second) {FactoryBot.create(:user_second)}
  describe 'バリデーションのテスト' do
    context '送信者と受信者間のメッセージが存在している場合' do
      it 'バリデーションにひっかる' do
        conversation = FactoryBot.create(:conversation,sender_id:user.id,recipient_id:user_second.id)
        new_conversation = Conversation.new(sender_id:user.id,recipient_id:user_second.id)
        expect(new_conversation).not_to be_valid
      end
    end
    context '送信者と受信者が初めてメッセージをする場合' do
      it 'バリデーションが通る' do
        new_conversation = Conversation.new(sender_id:user.id,recipient_id:user_second.id)
        expect(new_conversation).to be_valid
      end
    end
  end
  describe 'スコープのテスト' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:user_second) {FactoryBot.create(:user_second)}
    let!(:guest) {FactoryBot.create(:guest)}
    let!(:conversation) {FactoryBot.create(:conversation,sender_id:user.id,recipient_id:user_second.id)}
    let!(:second_conversation) {FactoryBot.create(:second_conversation,sender_id:user.id,recipient_id:guest.id)}
    context 'betweenスコープメソッド' do
      it 'Conversationモデルでレコードを確認できる' do
        between_test = Conversation.between(user.id,user_second.id).first
        between_test2 = Conversation.between(user_second.id,user.id).first
        expect(between_test).to eq Conversation.find(conversation.id)
        expect(between_test).to eq Conversation.find(conversation.id)
      end
    end
  end
end
