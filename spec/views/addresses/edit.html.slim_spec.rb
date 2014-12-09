require 'rails_helper'

RSpec.describe "addresses/edit", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :phone_number => "MyString",
      :mobile_1 => "MyString",
      :mobile_2 => "MyString",
      :city => "",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :addressable_id => 1,
      :addressable_type => "MyString",
      :email => "MyString",
      :website_url => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_phone_number[name=?]", "address[phone_number]"

      assert_select "input#address_mobile_1[name=?]", "address[mobile_1]"

      assert_select "input#address_mobile_2[name=?]", "address[mobile_2]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_address_1[name=?]", "address[address_1]"

      assert_select "input#address_address_2[name=?]", "address[address_2]"

      assert_select "input#address_addressable_id[name=?]", "address[addressable_id]"

      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"

      assert_select "input#address_email[name=?]", "address[email]"

      assert_select "input#address_website_url[name=?]", "address[website_url]"
    end
  end
end
