# == Schema Information
#
# Table name: foundations
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  active       :boolean
#  description  :text
#  featured     :boolean          default("false")
#  logo         :string
#  website_url  :string
#  twitter_url  :string
#  facebook_url :string
#  google_url   :string
#

FactoryGirl.define do
  factory :foundation do
    name "MyString"
  end

end
