require 'rails_helper'

RSpec.describe 'フォロー管理機能', type: :system do
  describe 'フォロー管理機能' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:user_second) {FactoryBot.create(:user_second)}
    let!(:guest) {FactoryBot.create(:guest)}
    context '自身が他のユーザーをフォローする場合' do
      it 'フォロー出来る' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        visit "/users/index"
        click_button "フォロー",match: :first
        expect(user.following.count).to eq 1
      end
    end
    context '自身がフォローしたユーザーの一覧を確認しようとする場合' do
      it '自身がフォローしたユーザーが確認できる' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        following1 = FactoryBot.create(:relationship,follower_id:user.id,followed_id:user_second.id)
        following2 = FactoryBot.create(:second_relationship,follower_id:user.id,followed_id:guest.id)
        visit "/relationships?follow=true"
        expect(user.following.count).to eq 2
        expect(page).to have_content "BB"
        expect(page).to have_content "Guest"
      end
    end
    context '自身をフォローしたユーザーの一覧を確認しようとする場合' do
      it '自身をフォローしたユーザーが確認できる' do
        visit user_session_path
        fill_in "user_email",with: "aa@test.com"
        fill_in "user_password",with: "123456"
        click_button "ログイン"
        follower1 = FactoryBot.create(:relationship,follower_id:user_second.id,followed_id:user.id)
        follower2 = FactoryBot.create(:second_relationship,follower_id:guest.id,followed_id:user.id)
        visit "/relationships?followed=true"
        expect(user.followers.count).to eq 2
        expect(page).to have_content "BB"
        expect(page).to have_content "Guest"
      end
    end
  end
end
