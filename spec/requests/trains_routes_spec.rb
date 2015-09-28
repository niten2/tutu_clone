require 'rails_helper'

RSpec.describe "TrainsRoutes", type: :request do
  describe "GET /trains_routes" do
    it "works! (now write some real specs)" do
      get trains_routes_path
      expect(response).to have_http_status(200)
    end
  end
end
