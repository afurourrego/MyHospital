require "rails_helper"

RSpec.describe ArlsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/arls").to route_to("arls#index")
    end

    it "routes to #new" do
      expect(:get => "/arls/new").to route_to("arls#new")
    end

    it "routes to #show" do
      expect(:get => "/arls/1").to route_to("arls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/arls/1/edit").to route_to("arls#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/arls").to route_to("arls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/arls/1").to route_to("arls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/arls/1").to route_to("arls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/arls/1").to route_to("arls#destroy", :id => "1")
    end
  end
end
