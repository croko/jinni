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

require 'rails_helper'

RSpec.describe Payment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
