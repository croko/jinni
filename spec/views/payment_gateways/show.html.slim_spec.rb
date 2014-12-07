require 'rails_helper'

RSpec.describe "payment_gateways/show", :type => :view do
  before(:each) do
    @payment_gateway = assign(:payment_gateway, PaymentGateway.create!(
      :name => "Name",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
