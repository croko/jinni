# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  phone_number     :string(255)
#  mobile_1         :string(255)
#  mobile_2         :string(255)
#  city_id          :integer
#  address_1        :string(255)
#  address_2        :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  email            :string(255)
#  website_url      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

FactoryGirl.define do
  factory :address do
    phone_number "MyString"
mobile_1 "MyString"
mobile_2 "MyString"
city ""
address_1 "MyString"
address_2 "MyString"
addressable_id 1
addressable_type "MyString"
email "MyString"
website_url "MyString"
  end

end
