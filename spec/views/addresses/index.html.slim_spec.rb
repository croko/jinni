require 'rails_helper'

RSpec.describe "addresses/index", :type => :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :phone_number => "Phone Number",
        :mobile_1 => "Mobile 1",
        :mobile_2 => "Mobile 2",
        :city => "",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :addressable_id => 1,
        :addressable_type => "Addressable Type",
        :email => "Email",
        :website_url => "Website Url"
      ),
      Address.create!(
        :phone_number => "Phone Number",
        :mobile_1 => "Mobile 1",
        :mobile_2 => "Mobile 2",
        :city => "",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :addressable_id => 1,
        :addressable_type => "Addressable Type",
        :email => "Email",
        :website_url => "Website Url"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile 1".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile 2".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Addressable Type".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Website Url".to_s, :count => 2
  end
end
