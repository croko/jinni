class Foundation < ActiveRecord::Base
  has_many :payment_systems, dependent: :destroy
  accepts_nested_attributes_for :payment_systems, allow_destroy: true
end
