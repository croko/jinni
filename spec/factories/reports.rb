# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  project_id :integer
#  goal       :string(255)
#  about      :text
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :report do
    project nil
goal "MyString"
about "MyText"
slug "MyString"
  end

end
