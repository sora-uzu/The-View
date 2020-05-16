require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /new' do
      before do
        get new_user_session_path
        user = FactoryBot.create(:user, name: 'test', email: 'email@example.com')
        post posts_url, params: { post: FactoryBot.attributes_for(:post, user: user) }
      end
      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end
  end

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
