require 'rails_helper'

RSpec.describe "addresses/show", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Mobile 1/)
    expect(rendered).to match(/Mobile 2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address 1/)
    expect(rendered).to match(/Address 2/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Addressable Type/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Website Url/)
  end
end
