# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :faq do
    title "MyString"
body "MyText"
published false
  end

end
