require 'rails_helper'

RSpec.describe "payment_gateways/index", :type => :view do
  before(:each) do
    assign(:payment_gateways, [
      PaymentGateway.create!(
        :name => "Name",
        :active => false
      ),
      PaymentGateway.create!(
        :name => "Name",
        :active => false
      )
    ])
  end

  it "renders a list of payment_gateways" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
