require 'rails_helper'

RSpec.describe "Planets", type: :request do
  fixtures :planets
  describe "GET /planets" do
    it 'gets a list of all planets' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
    end
    it 'gets one planet' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets/1", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
    end
    it 'deletes one planet' do
      expect(Planet.all.count).to eq 2
      headers = { "ACCEPT" => "application/json" }
      delete "/planets/1", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
      expect(Planet.all.count).to eq 1
    end
  end
end
