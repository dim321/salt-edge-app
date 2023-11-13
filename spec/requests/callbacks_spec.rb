require 'rails_helper'

RSpec.describe "Callbacks", type: :request do
  describe "GET /handler" do
    it "returns http success" do
      get "/callbacks/handler"
      expect(response).to have_http_status(:success)
    end
  end

end
