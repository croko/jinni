require 'rails_helper'

RSpec.describe "PaymentSystems", :type => :request do
  describe "GET /payment_systems" do
    it "works! (now write some real specs)" do
      get payment_systems_path
      expect(response).to have_http_status(200)
    end
  end
end
