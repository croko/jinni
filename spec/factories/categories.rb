# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  projects_count :integer
#  slug           :string(255)
#

FactoryGirl.define do
  factory :category do
    name "MyString"
  end

end
