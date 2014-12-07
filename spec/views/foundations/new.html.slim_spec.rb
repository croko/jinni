require 'rails_helper'

RSpec.describe "foundations/new", :type => :view do
  before(:each) do
    assign(:foundation, Foundation.new(
      :name => "MyString"
    ))
  end

  it "renders new foundation form" do
    render

    assert_select "form[action=?][method=?]", foundations_path, "post" do

      assert_select "input#foundation_name[name=?]", "foundation[name]"
    end
  end
end
