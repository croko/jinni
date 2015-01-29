# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  goal              :string(255)
#  about             :text
#  user_id           :integer
#  foundation_id     :integer
#  payment_system_id :integer
#  status            :integer          default("0")
#  date_start        :date
#  date_end          :date
#  category_id       :integer
#  amount            :decimal(8, 2)    default("0.0")
#  created_at        :datetime
#  updated_at        :datetime
#  location          :string(255)
#  featured          :boolean          default("false")
#  published         :boolean          default("false")
#  approved          :boolean          default("false")
#  slug              :string(255)
#  collected         :decimal(8, 2)    default("0.0")
#  payments_count    :integer
#  share             :boolean          default("true")
#  shared            :boolean          default("false")
#  fixed_price       :boolean          default("false")
#

FactoryGirl.define do
  factory :project do
    title "MyString"
goal "MyString"
about "MyText"
user nil
foundation nil
payment_system nil
status 1
date_start "2014-12-07"
date_end "2014-12-07"
category nil
amount "9.99"
  end

end
