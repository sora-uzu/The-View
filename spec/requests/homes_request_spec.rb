require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "トップページ" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
