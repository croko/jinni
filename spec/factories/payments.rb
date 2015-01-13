# == Schema Information
#
# Table name: payments
#
#  id                  :integer          not null, primary key
#  project_id          :integer
#  payment_gateway_id  :integer
#  sender_phone        :string(255)
#  payment_transaction :string(255)
#  payment_status      :string(255)
#  payment_type        :string(255)
#  liqpay_order_id     :string(255)
#  commission          :decimal(8, 2)    default("0.0")
#  currency            :string(255)
#  amount              :decimal(8, 2)    default("0.0")
#  created_at          :datetime
#  updated_at          :datetime
#  amount_currency     :decimal(8, 2)    default("0.0")
#  exchange_rate       :decimal(8, 4)    default("1.0")
#

FactoryGirl.define do
  factory :payment do
    project nil
sender_phone "MyString"
transaction "MyString"
payment_status "MyString"
payment_type "MyString"
commission "9.99"
currency "MyString"
amount "9.99"
  end

end
