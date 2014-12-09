# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)      not null
#  salt                            :string(255)      not null
#  first_name                      :string(255)
#  last_name                       :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#

class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  has_many :payment_systems
  has_many :addresses, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :authentications
  accepts_nested_attributes_for :payment_systems, :reject_if => lambda { |a| a[:payment_gateway_id].blank? }, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

end
