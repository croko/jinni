require 'rails_helper'

RSpec.describe "foundations/edit", :type => :view do
  before(:each) do
    @foundation = assign(:foundation, Foundation.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit foundation form" do
    render

    assert_select "form[action=?][method=?]", foundation_path(@foundation), "post" do

      assert_select "input#foundation_name[name=?]", "foundation[name]"
    end
  end
end
