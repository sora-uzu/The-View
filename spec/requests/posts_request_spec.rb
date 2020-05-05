require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'リクエストが成功すること' do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    before do
      post = FactoryBot.create(:post)
      get post_url post.id
    end

    it 'リクエストが成功すること' do
      expect(response).to have_http_status(:success)
    end

    it '投稿タイトルが表示されている' do
      expect(response.body).to include 'タイトル'
    end
  end

  describe 'GET #map' do
    before do
      get '/map'
    end
    it 'マップ一覧ページが表示される' do
      expect(response).to have_http_status(:success)
    end
  end
end
