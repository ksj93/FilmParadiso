require 'rails_helper'

RSpec.describe '映画評価の管理機能', type: :system do
  describe '映画評価のCRUD機能' do
    context '映画評価を新規作成した場合' do
      it '作成済みのタスク一覧が表示される' do
        # user = FactoryBot.create(:user)
        # RSpec.configuration.session[:user_id] = user.id
        # task = FactoryBot.create(:task, title: 'task',user:user)
        # visit tasks_path
        # expect(page).to have_content 'task'
      end
    end
    context '作成した評価の詳細ページにアクセスする場合' do
      it '選択した評価の詳細情報が見れる' do

      end
    end
    context '評価評価を編集した場合' do
      it '既存の情報が編集した情報に変わる' do

      end
    end
    context '映画評価を削除した場合' do
      it '全体の評価の数が減る' do

      end
    end
  end
  describe '他人の評価にアクセス' do
    
  end
end
