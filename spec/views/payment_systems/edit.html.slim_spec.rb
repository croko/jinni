require 'rails_helper'

RSpec.describe "payment_systems/edit", :type => :view do
  before(:each) do
    @payment_system = assign(:payment_system, PaymentSystem.create!(
      :name => "MyString",
      :foundation => nil,
      :user => nil,
      :public_key => "MyString",
      :private_key => "MyString",
      :active => false
    ))
  end

  it "renders the edit payment_system form" do
    render

    assert_select "form[action=?][method=?]", payment_system_path(@payment_system), "post" do

      assert_select "input#payment_system_name[name=?]", "payment_system[name]"

      assert_select "input#payment_system_foundation_id[name=?]", "payment_system[foundation_id]"

      assert_select "input#payment_system_user_id[name=?]", "payment_system[user_id]"

      assert_select "input#payment_system_public_key[name=?]", "payment_system[public_key]"

      assert_select "input#payment_system_private_key[name=?]", "payment_system[private_key]"

      assert_select "input#payment_system_active[name=?]", "payment_system[active]"
    end
  end
end
