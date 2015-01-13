# == Schema Information
#
# Table name: payment_gateways
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean          default("true")
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :payment_gateway do
    name "MyString"
active false
  end

end
