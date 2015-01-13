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

class PaymentGateway < ActiveRecord::Base
  has_many :payment_systems, dependent: :restrict_with_error
end
