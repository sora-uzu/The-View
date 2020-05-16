# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが空だとNG' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end
