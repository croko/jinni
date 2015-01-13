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

class Payment < ActiveRecord::Base

  include AdminPayment
  include ExchangeRate

  belongs_to :project, counter_cache: true
  belongs_to :payment_gateway

  validates :amount, presence: true

  before_create :calc_amount
  after_create :increment_project_collected
  after_destroy :decrement_project_collected


  def calc_amount
    if currency == 'UAH'
      self.amount = amount_currency - commission
    else
      self.exchange_rate = get_privat_rates(currency)
      self.amount = (amount_currency * exchange_rate) - commission
    end
  end

  protected

  def increment_project_collected
    project.increment!('collected', amount)
  end

  def decrement_project_collected
    project.decrement!('collected', amount)
  end
end
