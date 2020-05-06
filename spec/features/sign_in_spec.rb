require 'rails_helper'

describe 'ログインのテスト', type: :feature do
  before do
    visit new_user_session_path
    @user = FactoryBot.create(:user, name: 'test', email: 'email@example.com')
  end

  context '有効なログインの場合' do
    before do
      fill_in 'メールアドレス', with: 'email@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    it 'ユーザーページにリダイレクトされる' do
      expect(current_path).to eq(user_path(@user))
    end
    it 'ユーザー画面が表示される' do
      expect(page).to have_content 'test'
    end
  end
  context '無効なログインの場合' do
    before do
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      click_button 'ログイン'
    end
    it 'ログインが表示される' do
      expect(page).to have_content 'ログイン'
    end
  end
end
