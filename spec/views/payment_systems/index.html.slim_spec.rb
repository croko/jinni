require 'rails_helper'

RSpec.describe "payment_systems/index", :type => :view do
  before(:each) do
    assign(:payment_systems, [
      PaymentSystem.create!(
        :name => "Name",
        :foundation => nil,
        :user => nil,
        :public_key => "Public Key",
        :private_key => "Private Key",
        :active => false
      ),
      PaymentSystem.create!(
        :name => "Name",
        :foundation => nil,
        :user => nil,
        :public_key => "Public Key",
        :private_key => "Private Key",
        :active => false
      )
    ])
  end

  it "renders a list of payment_systems" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Public Key".to_s, :count => 2
    assert_select "tr>td", :text => "Private Key".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
