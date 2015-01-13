# == Schema Information
#
# Table name: payment_systems
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  foundation_id      :integer
#  user_id            :integer
#  payment_gateway_id :integer
#  public_key         :string(255)
#  private_key        :string(255)
#  active             :boolean          default("true")
#  created_at         :datetime
#  updated_at         :datetime
#

FactoryGirl.define do
  factory :payment_system do
    name "MyString"
foundation nil
user nil
public_key "MyString"
private_key "MyString"
active false
  end

end
