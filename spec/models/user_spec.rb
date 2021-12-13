require 'rails_helper'

describe 'ユーザーモデル機能', type: :model do
  let!(:user) {FactoryBot.create(:user)}
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name:"",email:"test@test.com",password:"123456")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのEメールが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:"test-man",email:"",password:"123456")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのEメールの＠を書いてない場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:"test-man",email:"test",password:"123456")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの映パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:"test-man",email:"test@test.com",password:"")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの映パスワードが規格より短いの場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name:"test-man",email:"test@test.com",password:"12345")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの名前、Eメール、パスワード(6字以上)場合' do
      it 'バリデーションが通る' do
        user = User.new(name:"test-man",email:"test@test.com",password:"123456")
        expect(user).to be_valid
      end
    end
  end
end
