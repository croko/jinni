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

require 'rails_helper'

RSpec.describe PaymentGateway, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
