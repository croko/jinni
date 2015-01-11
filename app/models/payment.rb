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
