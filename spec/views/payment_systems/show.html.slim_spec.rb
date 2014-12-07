require 'rails_helper'

RSpec.describe "payment_systems/show", :type => :view do
  before(:each) do
    @payment_system = assign(:payment_system, PaymentSystem.create!(
      :name => "Name",
      :foundation => nil,
      :user => nil,
      :public_key => "Public Key",
      :private_key => "Private Key",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Public Key/)
    expect(rendered).to match(/Private Key/)
    expect(rendered).to match(/false/)
  end
end
