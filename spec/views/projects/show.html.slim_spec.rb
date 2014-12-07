require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :title => "Title",
      :goal => "Goal",
      :about => "MyText",
      :user => nil,
      :foundation => nil,
      :payment_system => nil,
      :status => 1,
      :category => nil,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Goal/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
