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

require 'rails_helper'

RSpec.describe PaymentSystem, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
