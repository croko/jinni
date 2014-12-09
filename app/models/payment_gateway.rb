# == Schema Information
#
# Table name: payment_gateways
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class PaymentGateway < ActiveRecord::Base
end
