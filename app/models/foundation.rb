# == Schema Information
#
# Table name: foundations
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  active       :boolean
#  description  :string(255)
#  featured     :boolean          default("false")
#  logo         :string
#  website_url  :string
#  twitter_url  :string
#  facebook_url :string
#  google_url   :string
#

class Foundation < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  include AdminFoundation
  include SocialUrl

  has_many :payment_systems, dependent: :restrict_with_error
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :payment_systems, :reject_if => lambda { |a| a[:payment_gateway_id].blank? }, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  scope :published, -> {where(active: true)}

  def payment_ready
    payment_systems.active.any?
  end

  def self.payment_ready
    published.map{|fo| [fo.name, fo.id] if fo.payment_ready}.compact
  end
end
