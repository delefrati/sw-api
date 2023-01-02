require 'rails_helper'

RSpec.describe "Planets", type: :request do
  describe "GET /planets" do
    fixtures :planets
    it 'gets a list of all planets' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
      
      planets = JSON.parse(response.body)
      expect(planets.count).to eq 2
      expect(planets[0].count).to eq 7
    end
    it 'gets one planet' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets/1", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)

      planets = JSON.parse(response.body)
      expect(planets.count).to eq 7
    end
    it 'searchs for one planet' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets/?search=tatoo", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)

      planets = JSON.parse(response.body)
      expect(planets.count).to eq 1
      expect(planets[0].count).to eq 7
    end
    it 'searchs for two planet' do
      headers = { "ACCEPT" => "application/json" }
      get "/planets/?search=oo", :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)

      planets = JSON.parse(response.body)
      expect(planets.count).to eq 2
      expect(planets[0].count).to eq 7
    end
  end
  describe "DELETE /planets" do
    fixtures :planets
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
