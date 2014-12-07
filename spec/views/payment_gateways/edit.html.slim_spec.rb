require 'rails_helper'

RSpec.describe "payment_gateways/edit", :type => :view do
  before(:each) do
    @payment_gateway = assign(:payment_gateway, PaymentGateway.create!(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders the edit payment_gateway form" do
    render

    assert_select "form[action=?][method=?]", payment_gateway_path(@payment_gateway), "post" do

      assert_select "input#payment_gateway_name[name=?]", "payment_gateway[name]"

      assert_select "input#payment_gateway_active[name=?]", "payment_gateway[active]"
    end
  end
end
