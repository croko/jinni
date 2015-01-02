require 'rails_helper'

RSpec.describe "reports/show", :type => :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :project => nil,
      :goal => "Goal",
      :about => "MyText",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Goal/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Slug/)
  end
end
