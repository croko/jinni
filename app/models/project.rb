class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  # belongs_to :category
end
