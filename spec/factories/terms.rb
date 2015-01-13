# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :terms do
    body "MyText"
  end

end
