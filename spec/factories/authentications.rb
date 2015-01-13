# == Schema Information
#
# Table name: authentications
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  provider     :string(255)      not null
#  uid          :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  avatar_url   :string(255)
#  access_token :string
#

FactoryGirl.define do
  factory :authentication do
    
  end

end
