# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :agreement do
    body "MyText"
  end

end
