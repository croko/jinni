require 'rails_helper'

RSpec.describe "reports/index", :type => :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :project => nil,
        :goal => "Goal",
        :about => "MyText",
        :slug => "Slug"
      ),
      Report.create!(
        :project => nil,
        :goal => "Goal",
        :about => "MyText",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Goal".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
