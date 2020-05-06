require 'rails_helper'

describe '会員登録のテスト', type: :feature do
  before do
    visit new_user_registration_path
  end

  describe '無効なユーザの会員登録' do
    before do
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      click_button '登録'
    end

    it '会員登録が表示されること' do
      expect(page).to have_content '会員登録'
    end
  end

  describe '有効なユーザの会員登録' do
    before do
      fill_in 'user_name', with: 'test'
      fill_in 'user_email', with: 'email@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button '登録'
    end

    it 'ユーザーページにリダイレクトされる' do
      expect(page).to have_content 'test'
    end
  end
end
