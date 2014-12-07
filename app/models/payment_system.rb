class PaymentSystem < ActiveRecord::Base
  belongs_to :foundation
  belongs_to :user
  belongs_to :payment_gateway
end
