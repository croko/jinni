require 'rails_helper'

RSpec.describe "reports/new", :type => :view do
  before(:each) do
    assign(:report, Report.new(
      :project => nil,
      :goal => "MyString",
      :about => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input#report_project_id[name=?]", "report[project_id]"

      assert_select "input#report_goal[name=?]", "report[goal]"

      assert_select "textarea#report_about[name=?]", "report[about]"

      assert_select "input#report_slug[name=?]", "report[slug]"
    end
  end
end
