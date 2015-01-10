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

  mount_uploader :image, UserImageUploader

  include AdminUser
  include SocialUrl

  attr_reader :avatar_url

  has_many :authentications, dependent: :destroy
  has_many :payment_systems
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :projects
  has_many :finished_projects, -> { where(status: 1) }, class_name: 'Project'
  belongs_to :city

  accepts_nested_attributes_for :authentications
  accepts_nested_attributes_for :payment_systems, :reject_if => lambda { |a| a[:payment_gateway_id].blank? }, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :password, length: {minimum: 5}, allow_blank: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, allow_blank: true
  validates :email, presence: true, uniqueness: true

  validates :addresses, presence: true, on: :update

  after_create :notify_admin

  def fio
    last_name.to_s + ' ' + first_name.to_s
  end

  def avatar
    authentications.first.avatar_url
  end

  protected

  def notify_admin
    SystemMailer.new_user_registered(self).deliver_later
  end

end
