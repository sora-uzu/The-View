require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
      get edit_post_path(@post)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it '投稿タイトルが表示されている' do
      expect(response.body).to include 'タイトル'
    end

    it '説明が表示されている' do
      expect(response.body).to include '説明'
    end
  end
end
