require 'rails_helper'

RSpec.describe "PaymentGateways", :type => :request do
  describe "GET /payment_gateways" do
    it "works! (now write some real specs)" do
      get payment_gateways_path
      expect(response).to have_http_status(200)
    end
  end
end
