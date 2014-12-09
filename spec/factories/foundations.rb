# == Schema Information
#
# Table name: foundations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  active      :boolean
#  description :string(255)
#

FactoryGirl.define do
  factory :foundation do
    name "MyString"
  end

end
