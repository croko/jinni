require "rails_helper"

RSpec.describe PaymentSystemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/payment_systems").to route_to("payment_systems#index")
    end

    it "routes to #new" do
      expect(:get => "/payment_systems/new").to route_to("payment_systems#new")
    end

    it "routes to #show" do
      expect(:get => "/payment_systems/1").to route_to("payment_systems#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/payment_systems/1/edit").to route_to("payment_systems#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/payment_systems").to route_to("payment_systems#create")
    end

    it "routes to #update" do
      expect(:put => "/payment_systems/1").to route_to("payment_systems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/payment_systems/1").to route_to("payment_systems#destroy", :id => "1")
    end

  end
end
