class Payment < ActiveRecord::Base

  include AdminPayment

  belongs_to :project, counter_cache: true
  belongs_to :payment_gateway

  validates :amount, presence: true

  after_create :increment_project_collected
  after_destroy :decrement_project_collected


  protected

  def increment_project_collected
    project.increment!('collected', amount)
  end

  def decrement_project_collected
    project.decrement!('collected', amount)
  end
end
