require "rails_helper"

RSpec.describe PaymentGatewaysController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/payment_gateways").to route_to("payment_gateways#index")
    end

    it "routes to #new" do
      expect(:get => "/payment_gateways/new").to route_to("payment_gateways#new")
    end

    it "routes to #show" do
      expect(:get => "/payment_gateways/1").to route_to("payment_gateways#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/payment_gateways/1/edit").to route_to("payment_gateways#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/payment_gateways").to route_to("payment_gateways#create")
    end

    it "routes to #update" do
      expect(:put => "/payment_gateways/1").to route_to("payment_gateways#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/payment_gateways/1").to route_to("payment_gateways#destroy", :id => "1")
    end

  end
end
