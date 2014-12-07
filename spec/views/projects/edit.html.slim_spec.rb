require 'rails_helper'

RSpec.describe "projects/edit", :type => :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :title => "MyString",
      :goal => "MyString",
      :about => "MyText",
      :user => nil,
      :foundation => nil,
      :payment_system => nil,
      :status => 1,
      :category => nil,
      :amount => "9.99"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_title[name=?]", "project[title]"

      assert_select "input#project_goal[name=?]", "project[goal]"

      assert_select "textarea#project_about[name=?]", "project[about]"

      assert_select "input#project_user_id[name=?]", "project[user_id]"

      assert_select "input#project_foundation_id[name=?]", "project[foundation_id]"

      assert_select "input#project_payment_system_id[name=?]", "project[payment_system_id]"

      assert_select "input#project_status[name=?]", "project[status]"

      assert_select "input#project_category_id[name=?]", "project[category_id]"

      assert_select "input#project_amount[name=?]", "project[amount]"
    end
  end
end
