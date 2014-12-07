require "rails_helper"

RSpec.describe FoundationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/foundations").to route_to("foundations#index")
    end

    it "routes to #new" do
      expect(:get => "/foundations/new").to route_to("foundations#new")
    end

    it "routes to #show" do
      expect(:get => "/foundations/1").to route_to("foundations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/foundations/1/edit").to route_to("foundations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/foundations").to route_to("foundations#create")
    end

    it "routes to #update" do
      expect(:put => "/foundations/1").to route_to("foundations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/foundations/1").to route_to("foundations#destroy", :id => "1")
    end

  end
end
