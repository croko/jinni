require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :title => "Title",
        :goal => "Goal",
        :about => "MyText",
        :user => nil,
        :foundation => nil,
        :payment_system => nil,
        :status => 1,
        :category => nil,
        :amount => "9.99"
      ),
      Project.create!(
        :title => "Title",
        :goal => "Goal",
        :about => "MyText",
        :user => nil,
        :foundation => nil,
        :payment_system => nil,
        :status => 1,
        :category => nil,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Goal".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
