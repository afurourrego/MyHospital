require "rails_helper"

RSpec.describe EpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/eps").to route_to("eps#index")
    end

    it "routes to #new" do
      expect(:get => "/eps/new").to route_to("eps#new")
    end

    it "routes to #show" do
      expect(:get => "/eps/1").to route_to("eps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/eps/1/edit").to route_to("eps#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/eps").to route_to("eps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/eps/1").to route_to("eps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/eps/1").to route_to("eps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/eps/1").to route_to("eps#destroy", :id => "1")
    end
  end
end
