require 'rails_helper'

RSpec.describe "payment_gateways/new", :type => :view do
  before(:each) do
    assign(:payment_gateway, PaymentGateway.new(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new payment_gateway form" do
    render

    assert_select "form[action=?][method=?]", payment_gateways_path, "post" do

      assert_select "input#payment_gateway_name[name=?]", "payment_gateway[name]"

      assert_select "input#payment_gateway_active[name=?]", "payment_gateway[active]"
    end
  end
end
