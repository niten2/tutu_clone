require "rails_helper"

RSpec.describe TrainsRoutesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trains_routes").to route_to("trains_routes#index")
    end

    it "routes to #new" do
      expect(:get => "/trains_routes/new").to route_to("trains_routes#new")
    end

    it "routes to #show" do
      expect(:get => "/trains_routes/1").to route_to("trains_routes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trains_routes/1/edit").to route_to("trains_routes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trains_routes").to route_to("trains_routes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trains_routes/1").to route_to("trains_routes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trains_routes/1").to route_to("trains_routes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trains_routes/1").to route_to("trains_routes#destroy", :id => "1")
    end

  end
end
