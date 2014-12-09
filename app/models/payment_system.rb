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
#  active             :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#

class PaymentSystem < ActiveRecord::Base
  belongs_to :foundation
  belongs_to :user
  belongs_to :payment_gateway
end
