# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  before do
    @post = build(:post)
  end

  describe 'バリデーション' do
    it 'titleが空だとNG' do
      @post.title = ''
      expect(@post.valid?).to eq(false)
    end

    it 'descriptionが空だとNG' do
      @post.description = ''
      expect(@post.valid?).to eq(false)
    end

    it '写真が空だとNG' do
      @post.image_id = ''
      expect(@post.valid?).to eq(false)
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
