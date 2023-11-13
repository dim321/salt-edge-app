require 'rails_helper'

RSpec.describe "Callbacks", type: :request do
  describe "POST /handler" do
    it "returns http unprocessable_entity" do
      post "/callbacks/success"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  # TODO: successfull cases
end
