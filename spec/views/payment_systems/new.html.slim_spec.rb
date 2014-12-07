require 'rails_helper'

RSpec.describe "payment_systems/new", :type => :view do
  before(:each) do
    assign(:payment_system, PaymentSystem.new(
      :name => "MyString",
      :foundation => nil,
      :user => nil,
      :public_key => "MyString",
      :private_key => "MyString",
      :active => false
    ))
  end

  it "renders new payment_system form" do
    render

    assert_select "form[action=?][method=?]", payment_systems_path, "post" do

      assert_select "input#payment_system_name[name=?]", "payment_system[name]"

      assert_select "input#payment_system_foundation_id[name=?]", "payment_system[foundation_id]"

      assert_select "input#payment_system_user_id[name=?]", "payment_system[user_id]"

      assert_select "input#payment_system_public_key[name=?]", "payment_system[public_key]"

      assert_select "input#payment_system_private_key[name=?]", "payment_system[private_key]"

      assert_select "input#payment_system_active[name=?]", "payment_system[active]"
    end
  end
end
