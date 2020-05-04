# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create :user
    end

    it 'リクエストが成功すること' do
      get users_path
      expect(response.status).to eq(200)
    end

    it 'user名が表示される' do
      get users_path
      expect(response.body).to include 'name'
    end
  end

  describe 'GET /edit' do
    before do
      user = FactoryBot.create(:user)
      get user_url user.id
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'user名が表示される' do
      expect(response.body).to include 'name'
    end
  end

  describe 'GET /show' do
    describe 'ユーザーが存在する場合' do
      before do
        user = FactoryBot.create(:user)
        get user_url user.id
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'user名が表示される' do
        expect(response.body).to include 'name'
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end
end
