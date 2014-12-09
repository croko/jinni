# == Schema Information
#
# Table name: foundations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  active      :boolean
#  description :string(255)
#

class Foundation < ActiveRecord::Base
  has_many :payment_systems, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :payment_systems, allow_destroy: true
end
