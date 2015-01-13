# == Schema Information
#
# Table name: authentications
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  provider     :string(255)      not null
#  uid          :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  avatar_url   :string(255)
#  access_token :string
#

class Authentication < ActiveRecord::Base
  belongs_to :user

  before_create :process_avatar

  scope :facebook, -> {where(provider: 'facebook')}
  scope :google, -> {where(provider: 'google')}

  def process_avatar
    if provider == 'facebook'
      self.avatar_url = "https://graph.facebook.com/#{uid}/picture?type=large"
    end

  end
end
