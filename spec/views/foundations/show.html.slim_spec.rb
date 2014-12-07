require 'rails_helper'

RSpec.describe "foundations/show", :type => :view do
  before(:each) do
    @foundation = assign(:foundation, Foundation.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
