require 'rails_helper'

RSpec.describe "foundations/index", :type => :view do
  before(:each) do
    assign(:foundations, [
      Foundation.create!(
        :name => "Name"
      ),
      Foundation.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of foundations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
